FROM searxng/searxng:latest

# نسخ ملف الإعدادات الرئيسي الخاص بك
COPY ./settings.yml /etc/searxng/settings.yml

# إنشاء ملف limiter.toml لتعطيل فحص البوتات تماماً داخل الحاوية
RUN echo '[botdetection]' > /etc/searxng/limiter.toml && \
    echo 'enable = false' >> /etc/searxng/limiter.toml && \
    echo '[botdetection.http_user_agent]' >> /etc/searxng/limiter.toml && \
    echo 'sh_lock_user_agent = false' >> /etc/searxng/limiter.toml && \
    echo '[botdetection.ip_limit]' >> /etc/searxng/limiter.toml && \
    echo 'link_token_allowance = 1000000' >> /etc/searxng/limiter.toml

# إجبار المحرك على اعتماد المسارات الصحيحة للملفات بشكل نهائي
ENV SEARXNG_SETTINGS_PATH=/etc/searxng/settings.yml
ENV SEARXNG_LIMITER_PATH=/etc/searxng/limiter.toml

EXPOSE 8080
