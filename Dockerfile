FROM searxng/searxng:latest

# 1. نسخ إعداداتك الحالية
COPY ./settings.yml /etc/searxng/settings.yml

# 2. إنشاء ملف limiter.toml مخصص لتعطيل فحص البوتات تماماً داخل السيرفر
RUN echo '[botdetection]' > /etc/searxng/limiter.toml && \
    echo 'enable = false' >> /etc/searxng/limiter.toml && \
    echo '[botdetection.http_user_agent]' >> /etc/searxng/limiter.toml && \
    echo 'sh_lock_user_agent = false' >> /etc/searxng/limiter.toml

# 3. إجبار البيئة على قراءة الملفات من المسارات الصحيحة
ENV SEARXNG_SETTINGS_PATH=/etc/searxng/settings.yml
ENV SEARXNG_LIMITER_PATH=/etc/searxng/limiter.toml

EXPOSE 8080
