Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35C012FB96C
	for <linux-samsung-soc@vger.kernel.org>; Wed, 15 Oct 2025 07:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760514804; cv=none; b=sMeWrROQA24mhWVym7NEbsRV15gf8hv7IuK3EGTmU+oAAH9/uzzmUjZOtZWWr8AVreIe8Fa/Colu9X+MAWz7R3hXI24Si9yqddSXzEiD2jgMUEOtDs4uYaci2KUxO91OOdEDQkeMgW4zRJYYRKyZmS0TbF4quh06fZ9ZfT1tYXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760514804; c=relaxed/simple;
	bh=/BrnxgRvfxsByTFmhZBOY+/B1WEWcZSF203srsQwXF8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=phxLBWkTWGKRKACZBOJpAM5g/jKFjkCTNbTUaH+kJxLVd4KFTIS+2e9BPvi3toYkhBqe5YPJLSTmCIL6pQLejEF6dYhYYKG1tCcqTXW7SDCLjqhUCLVuR/rEme2LXjj1Q5Bk3dP9vTTFWCrTX4X2uid+a7ZjGhFTdbt1dy/QhlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YK/ErJOe; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YK/ErJOe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760514802;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t+HZgDzRdpaVTxvZqJl2rTn2R8LelhY8vbHUCgBN35M=;
	b=YK/ErJOe4ySVCbEZDx7t4Rrs+YpkmUaM7i5Nz8Y2h+86ClpnfCycAlli2dCvg0nT/gT/JJ
	JBDBMlxp2hivbyqDWvU/75CgrhsccnHK+b3Xj3G3Jc+4XlwhYzO99y2bT356rpLEV9g9et
	FVX3f1NwA3XVu1jQxknmOcCO4r1UFG8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-695-l8oqOkt4Obe0Fa4e8MVXvQ-1; Wed, 15 Oct 2025 03:53:20 -0400
X-MC-Unique: l8oqOkt4Obe0Fa4e8MVXvQ-1
X-Mimecast-MFC-AGG-ID: l8oqOkt4Obe0Fa4e8MVXvQ_1760514800
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-46e509374dcso27163445e9.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 15 Oct 2025 00:53:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760514799; x=1761119599;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t+HZgDzRdpaVTxvZqJl2rTn2R8LelhY8vbHUCgBN35M=;
        b=ZJ7UgHOq8XTfOVKn4Y6BYRak58aOHsXffxp5cB9wKT7Y30fHYv2ldV7o79j3J+fHmQ
         7ZrA6l2uzFHG/je+Orzas4XLr6FSXBYEPDMrjmIt9XD3i5pRL/ecOLv3FL9wXdvJZvSr
         e8femDDC6ONVskOQqdOsG6WUKGm0IUnYH3Sd/ZUg34eQt55nFnRYnJyPZiu9hYrb3C5/
         MJROQ69VnOCvwvKQWlqjbG/0SoI8ESC0x+whCtSRvIFhp5iTd8gCeTQpfXkTO8ov+VAD
         sOcSDaSYvIs1c9l6avYZN+rGthZZgAJQB5GPKqHYT2Iq7MEYtfSPXhoDd5YL/HmgS+gV
         Ohbg==
X-Forwarded-Encrypted: i=1; AJvYcCUquXHXGjH2CnlTEpeS5gwVbQnf9JWV65cM4IrW8R7T9glHtXw2yWayCY/CGMvDfp7XhGD6zMQhJlKvAzSmQUUHgA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwTO/eXGAxpwDUg2PE+8hFXa89GsLKjF5bbrkcLUFP0vofVX0fu
	qUiFFCJ9QrYHsnGJJlr7CzB5DrTF5/7227C7pjuw4rtutTzmaj+fXW3MD9qw0l6/dEhCj6N4KbJ
	k5JP44/I/e8ohcUnGPdBFtawzW20WSO7FxglXPDIw5Rd0ocLpcTjFAUF7MiWC9bI0/DE6kKXV
X-Gm-Gg: ASbGncsnuOiP9DMRQ23o6rZxdtAZs5ei35GV08hDJP7AQscF7VIpTNzDSwY09dhV7p2
	x2uWma6sNLpsFR3KBRk//GJNxY1Spry/TBJdJmH5StkIpdjZ098ObgimTn+EJwXfmtLtxnMNNWB
	qivxabLnKaV2/CnRFHh88deeuh2tOr8E9zCCF7LRyrwM90wbH1eJYUmdZlMVPBU+T5b7qkKS1eV
	HzQkMQLXRpk6gfLxpywjpicm8+tZw/ihdwJCka9ojMOlYsjo4ehAuqw/6R4eZHKNAjiTRMjfDPR
	pa40UrQtmosCPNik5wIiZD0et73sEX+2dzoki4Zr+VD0D1NU7UoFyvTPOefEtjQKRq87V5Xw1bW
	2AQEM
X-Received: by 2002:a05:600c:1e28:b0:45b:47e1:ef6d with SMTP id 5b1f17b1804b1-46fa9b11746mr202661505e9.36.1760514799498;
        Wed, 15 Oct 2025 00:53:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEZf7d9TK63edfjPsh4LrX74Y6wRlhtOgKLsjlyk6mKGtY9U4BbM1bQ2mcLbjosAJUslcGWjg==
X-Received: by 2002:a05:600c:1e28:b0:45b:47e1:ef6d with SMTP id 5b1f17b1804b1-46fa9b11746mr202661265e9.36.1760514799084;
        Wed, 15 Oct 2025 00:53:19 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:8998:e0cf:68cc:1b62? ([2a01:e0a:c:37e0:8998:e0cf:68cc:1b62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47101c21805sm14875785e9.10.2025.10.15.00.53.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Oct 2025 00:53:18 -0700 (PDT)
Message-ID: <c256b8d9-ec9e-4841-9136-1198ad2d590a@redhat.com>
Date: Wed, 15 Oct 2025 09:53:15 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] drm/log: Add free callback
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-tegra@vger.kernel.org
References: <20251009132006.45834-1-tzimmermann@suse.de>
 <20251009132006.45834-4-tzimmermann@suse.de>
Content-Language: en-US, fr
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20251009132006.45834-4-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/10/2025 15:16, Thomas Zimmermann wrote:
> Free the client memory in the client free callback. Also move the
> debugging output into the free callback: drm_client_release() puts
> the reference on the DRM device, so pointers to the device should
> be considered dangling afterwards.

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/clients/drm_log.c | 14 +++++++++++---
>   1 file changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/clients/drm_log.c b/drivers/gpu/drm/clients/drm_log.c
> index 116e0ef9ae5d..470df4148e96 100644
> --- a/drivers/gpu/drm/clients/drm_log.c
> +++ b/drivers/gpu/drm/clients/drm_log.c
> @@ -293,19 +293,26 @@ static void drm_log_free_scanout(struct drm_client_dev *client)
>   	}
>   }
>   
> -static void drm_log_client_unregister(struct drm_client_dev *client)
> +static void drm_log_client_free(struct drm_client_dev *client)
>   {
>   	struct drm_log *dlog = client_to_drm_log(client);
>   	struct drm_device *dev = client->dev;
>   
> +	kfree(dlog);
> +
> +	drm_dbg(dev, "Unregistered with drm log\n");
> +}
> +
> +static void drm_log_client_unregister(struct drm_client_dev *client)
> +{
> +	struct drm_log *dlog = client_to_drm_log(client);
> +
>   	unregister_console(&dlog->con);
>   
>   	mutex_lock(&dlog->lock);
>   	drm_log_free_scanout(client);
>   	mutex_unlock(&dlog->lock);
>   	drm_client_release(client);
> -	kfree(dlog);
> -	drm_dbg(dev, "Unregistered with drm log\n");
>   }
>   
>   static int drm_log_client_hotplug(struct drm_client_dev *client)
> @@ -339,6 +346,7 @@ static int drm_log_client_resume(struct drm_client_dev *client, bool _console_lo
>   
>   static const struct drm_client_funcs drm_log_client_funcs = {
>   	.owner		= THIS_MODULE,
> +	.free		= drm_log_client_free,
>   	.unregister	= drm_log_client_unregister,
>   	.hotplug	= drm_log_client_hotplug,
>   	.suspend	= drm_log_client_suspend,

