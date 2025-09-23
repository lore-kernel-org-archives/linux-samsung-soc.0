Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55CA223C8D5
	for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Sep 2025 15:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758639816; cv=none; b=FOL00eql0Gv8plT9qHxTQ/JVRDXBMlhbSrPyXabe8kOhWndGDPLuOYrQSyygUoMlQwouCE4bCmwlDkrLmoTOm3pmZduBhSlxb3trUcSt3oDLCwWgOn/xyOUukbOm1cMdIwWCbqvIoq1UB5aswKqJCpi1DhpRLlkh0am2H4mMySk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758639816; c=relaxed/simple;
	bh=zQWTB2d0cJCKk/rrYKC1U8EECVIHzoagaVY6jLMFFHg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NvmfLmnngURWA64ZhK495KyOvz49O6c3RTyI8cYy0llRWq6jsiRNYO5JaNf2H4ohcrY2IUseKRt2gvdAZGm+GLbaw5sKpZdo9zeqKmm5i6K9ow15NXFntSQuRKNtcuuohJiGu3dAvEIY23Kpbd5Vv7jU5bbXaHr2te66hInE+0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kZmfPz7/; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kZmfPz7/"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-71d603a269cso39340037b3.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Sep 2025 08:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758639814; x=1759244614; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YcYie2cAKkOnUbqZ9iZ6V6CL9Gzada5AicC5iMnOBfQ=;
        b=kZmfPz7/HQXut4TJzw4U3NWVWbx1fM6XXw+IJJ8ctWBwE3XuHgZtHAkC8msht1tc9m
         Bd3kjcm07VwstT4oVs/f0wS+TxTwv16a7UGwRLTGQaCNMyI2l2bm6Q34mtSSiCGFIO6s
         ft6/YfVwiymdv/AeB3JSZ6MsFbvgv7JFzx5jHjR/sMRL0jigA22H2ICVXUcR1nx/y7Fd
         u8WFX47mfiix1j833Jhawu2LVBBiWsch+nJq7ljasSYjpb/iEurRc551YM07VWbVT/Lj
         Y1dFqSvyKtEnM/QhEModt8dlvxXtcJcYr4MdmKW1CRagKvHZ34MlkHCc1We8nHj+mASO
         2Eaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758639814; x=1759244614;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YcYie2cAKkOnUbqZ9iZ6V6CL9Gzada5AicC5iMnOBfQ=;
        b=LXOUQkSb8WRGeddf/qmmKQzjTWCVgbn8LgAyo930az02+M98lPJ8Tviaetav72VWcW
         JNZl62uwXjnGIEcaFwf0x0i/iUl7aVuhM0pn+ZbVjub++B5953RAgf6wD45bMfICnTx2
         Hwc4Ikr6vb5vu1MNSL2xp9lbfMmXmFd0DUFfYNJNCDOm85sIsu+fRMuvr76fBKH8qn4X
         CJpoks9nAwSYiPmb+Sq5xL9b6tUv0X8LjRm+eOXZm5UemS4rZ+6skUElCuY2a2CA7Hxr
         hmGZAlQyUqgjfcEMW0qWDnAr8j17uUNmIjAfsNvvHafm5QrUnG1vDEmnIn0BhJCFTIMx
         rrFg==
X-Forwarded-Encrypted: i=1; AJvYcCWVD1HVflN/We/z07Ei17Gz5X2EDZWDtWxvsUJmeok8hRu4Cr8LGRGZZDPezk0fgjFmebY7bJhno+VNsWcF9Cx+zg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxmxKAf+6M96UzqlWk8V4siKRy071+8/mu3jHzP3QMvcMaAZuTr
	v0PKzV+YWLJ2LqjJvLNlhy2bzUSQ1+kbve7bE5Ml6KrwHnCSLTga6pXGJLjWxH0Tr7xydz1ZdQh
	EObjPE943/eIk+vj/vUifyWYL4pnAz7DY4vZ8aaM9UQ==
X-Gm-Gg: ASbGncsikr7Rd/EF/kFwLr9Y3TrLtMKCOSjZrYVO1qqgp9V8KNXncy/Z6Gb246NScsc
	M+nlGQwQyxO8BJgH9hY9CzGEEYGYFSwTLLw8rWC6HrWZT3+TCWJCcgqPHgadUZ5I5NJcRBhV+iK
	bgWSsodZkoVKrkpKhYtebloz/zNWum5vJB9I14hbQzDUFlrNyjgwwDlAWHUqmqLPVJ5tvqf2umX
	saIX0Fc2cMVDQDwd8FFrtjr2s0=
X-Google-Smtp-Source: AGHT+IFHn90x28JHbA7vjSDiwfdoTTPXMbOARP3I17KAJBJ/rJ5XITQcCBtsYmuIRAiIfgX1fgiiGgjUyy0jEa80iZ4=
X-Received: by 2002:a05:690c:6c91:b0:725:1bc6:7cae with SMTP id
 00721157ae682-758a43264a8mr27454997b3.41.1758639813938; Tue, 23 Sep 2025
 08:03:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250914131848.2622817-1-ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <20250914131848.2622817-1-ivo.ivanov.ivanov1@gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 23 Sep 2025 17:02:58 +0200
X-Gm-Features: AS18NWARyvKgXOeXvo9XZeI4u88VSQ5LHm-6zhc4kVML80ebLhJCorioq3hgWH0
Message-ID: <CAPDyKFq9F6u5+aT_CkRG7rcOLrRWv-9wfw8tcT+w72kB8QVwAw@mail.gmail.com>
Subject: Re: [PATCH v1] dt-bindings: mmc: samsung,exynos-dw-mshc: add specific
 compatible for exynos8890
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Conor Dooley <conor+dt@kernel.org>, 
	Jaehoon Chung <jh80.chung@samsung.com>, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 14 Sept 2025 at 15:18, Ivaylo Ivanov
<ivo.ivanov.ivanov1@gmail.com> wrote:
>
> Add samsung,exynos8890-dw-mshc-smu specific compatible to the bindings
> documentation. Since Samsung, as usual, likes reusing devices from older
> designs, use the samsung,exynos7-dw-mshc-smu compatible.
>
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>

Applied for next, thanks!

Kind regards
Uffe

> ---
>  .../devicetree/bindings/mmc/samsung,exynos-dw-mshc.yaml          | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/mmc/samsung,exynos-dw-mshc.yaml b/Documentation/devicetree/bindings/mmc/samsung,exynos-dw-mshc.yaml
> index e8bd49d46..27c4060f2 100644
> --- a/Documentation/devicetree/bindings/mmc/samsung,exynos-dw-mshc.yaml
> +++ b/Documentation/devicetree/bindings/mmc/samsung,exynos-dw-mshc.yaml
> @@ -31,6 +31,7 @@ properties:
>                - samsung,exynos5433-dw-mshc-smu
>                - samsung,exynos7885-dw-mshc-smu
>                - samsung,exynos850-dw-mshc-smu
> +              - samsung,exynos8890-dw-mshc-smu
>                - samsung,exynos8895-dw-mshc-smu
>            - const: samsung,exynos7-dw-mshc-smu
>
> --
> 2.43.0
>
