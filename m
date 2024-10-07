Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAB442572;
	Mon,  7 Oct 2024 01:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728265601; cv=none; b=nxQ3qOM4FhfhSc3DnZ9UsT0Md5NC9VJVS5yhtrIFiHSzAJGmKDtNC6fmp9NId/9CAB7C5R+MisNBGvP0JIXUsyJ7bD4kLc+1HKBgHRwZuikNd2BhobNR1PgwkTQx0GTxS0V/OD6pbxxIfLI5GhVL6uj6xrwOo39YeC3+/sdAr/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728265601; c=relaxed/simple;
	bh=pL2+gFYHLLDpZRy2ohbWukK214pq77RPThQxwH9oYQc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fbVUf3i5SI/cxiSCLmQ3hkLBObyr0gd42bf8+hU35kAatMcbWeWAO+lhHf/ycKTrKlBKmgm0ICAC1s4dtT+zgbI6+ag6qZ2mxkGxhIJQykAjdpin7dwmqf81EtiErMoyfEnvQzWwraLhcoJAiKtqbLXrMZ0rv6MzNgpbXywmTU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q8WxkcVL; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q8WxkcVL"
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-509bd2e944dso1195367e0c.2;
        Sun, 06 Oct 2024 18:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728265598; x=1728870398; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6I7P4o4lqoq+/5/fIQFIlC3dJz4di8qGjmyqkb1fWR8=;
        b=Q8WxkcVLhMM546r5aHaedC8WURoNL2jvNLZGMEI208b4IDb4QePVi/lRRc0yOal4Gk
         PHBU9rbldE78Py3wm7E9B8OlflNl4FHn0z/Mjev/1pS9Xp+YZ5xeAs1ygbzoQSm1RbHp
         RIiZAfQf5nquxCrPsvOUDY7krWdT7YkiWA0SEPSnjXxM3tuLgIoS02Fie6rQYKNP80yx
         GTjRfcp0NW2N+BnAboofLIpx/0I504P+V0GOIAvibo/gnP0XqpLMuLsSwa8Ma4mjHigV
         E/M+M4WvkotKSpAh5pdO5+QitxfVMr6qWnn9tgL+RVw3vWXfpXxw54bs+csHQHa1H87t
         kdPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728265598; x=1728870398;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6I7P4o4lqoq+/5/fIQFIlC3dJz4di8qGjmyqkb1fWR8=;
        b=Eh78GptoyLegFivxT8xar/7B6MN/WoO012tpEgdc5UoJEO468X37U+YYkoyK7CcaY5
         wbDAREn7Ej6/2A9lQWCxYWQf5wX3UkCQPuXUUM79b1+U79mN+6NyfGKvuyGXou5oJh12
         kwcCWbAq+6PlHjYV3LKNFPURo4Lc2CA86JoL1jIFKqkqW0j4lAcHlADE2KZ3GZrPUIgu
         G1MdAX9j60KRWWRZIpSkjBkki7YExpmooc0tb78vmbIeH3L4dhuGbJAYzl55RXKmDPSQ
         8VH0nDypUiNufdbDzTen9z9ZtU4W01yl0XxO8DnvcT6xyodMl/BNad8HzMxFVafVShig
         SMdw==
X-Forwarded-Encrypted: i=1; AJvYcCVVS4ZMETLbUWP6K0LOdoPyk9+VK7REPi2e7HKNKsTLE4AUfMjICFXU3pDNj+VUk9fvDoqtA0WrrlGVGZ4=@vger.kernel.org, AJvYcCWn5Qt//8qVjAAblLbOXUkQNbDP9PSPRArqP88yN6i85VwWHfsgtGOgk/7QHr30+q3SAA7BUvrF04RIgnZxhITy/x0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6tu7UOA+KzI/3pNDUFxqzgNcO/4GK8orb75d2gEU4cefzjUBw
	XH1F2KXzH5jxebo1MsiqfApdtjhBXfyxwG/XHDf6YIht/VDeG6lOTpNHUAGhbAMdQY2lZLXt+9v
	CAApW+s3QeZRVPafHg6A06dxvIPs=
X-Google-Smtp-Source: AGHT+IHn77otsKYlNOvgcsPX5BgvnpzzQqomM/S9P5IjJKyLNB7h0JdstqFb1GMHjr7HniWTcTfA6P2c37takKxUm+4=
X-Received: by 2002:a05:6122:3d15:b0:50c:79a4:c4a with SMTP id
 71dfb90a1353d-50c855966e4mr5467687e0c.13.1728265598461; Sun, 06 Oct 2024
 18:46:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20240926052608epcas1p39e2db7b275e944285d0925b3e5c649b9@epcas1p3.samsung.com>
 <20240926-remove_crtc-v1-1-9a20062444cb@samsung.com>
In-Reply-To: <20240926-remove_crtc-v1-1-9a20062444cb@samsung.com>
From: Inki Dae <daeinki@gmail.com>
Date: Mon, 7 Oct 2024 10:46:02 +0900
Message-ID: <CAAQKjZPkc+y47Pv87EmUhLJ9SFASOuMKgvvN0UXZcg11tkjaOg@mail.gmail.com>
Subject: Re: [PATCH] drm/exynos: remove unused prototype for crtc
To: Kwanghoon Son <k.son@samsung.com>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2024=EB=85=84 9=EC=9B=94 26=EC=9D=BC (=EB=AA=A9) =EC=98=A4=ED=9B=84 2:33, K=
wanghoon Son <k.son@samsung.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> exynos_drm_crtc_wait_pending_update, exynos_drm_crtc_finish_update
> are not used anymore.

Merged.

Thanks,
Inki Dae

>
> Signed-off-by: Kwanghoon Son <k.son@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_crtc.h | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_crtc.h b/drivers/gpu/drm/e=
xynos/exynos_drm_crtc.h
> index 0ed4f2b8595a..1815374c38df 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_crtc.h
> +++ b/drivers/gpu/drm/exynos/exynos_drm_crtc.h
> @@ -19,9 +19,6 @@ struct exynos_drm_crtc *exynos_drm_crtc_create(struct d=
rm_device *drm_dev,
>                                         enum exynos_drm_output_type out_t=
ype,
>                                         const struct exynos_drm_crtc_ops =
*ops,
>                                         void *context);
> -void exynos_drm_crtc_wait_pending_update(struct exynos_drm_crtc *exynos_=
crtc);
> -void exynos_drm_crtc_finish_update(struct exynos_drm_crtc *exynos_crtc,
> -                                  struct exynos_drm_plane *exynos_plane)=
;
>
>  /* This function gets crtc device matched with out_type. */
>  struct exynos_drm_crtc *exynos_drm_crtc_get_by_type(struct drm_device *d=
rm_dev,
>
> ---
> base-commit: 684a64bf32b6e488004e0ad7f0d7e922798f65b6
> change-id: 20240925-remove_crtc-9647baaab5cd
>
> Best regards,
> --
> Kwanghoon Son <k.son@samsung.com>
>
>
