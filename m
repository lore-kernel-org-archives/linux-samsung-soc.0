Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 609624766B8
	for <linux-samsung-soc@vger.kernel.org>; Wed, 26 Aug 2026 19:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787770992; cv=none; b=GhBL1WwCJ8D4+7xA5yp/+afwjRF2yy9nlHmikokCqkMPTzIFivc+ZRalONjD3VjRae0Rv8IjSGF6S9itKIbrgkCSiTPUIo3iLjhxr2g78KlnouvUwf3Cx6xFxfbi8dXmivuTvNvTITAd3T79uZQQRWBt9K/8KmkYp1NYRLAt2/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787770992; c=relaxed/simple;
	bh=wvM8aRvWPmKDto0w4PK3ahRPwdGDE0+KecxUUFw61Bw=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=AexW4kJSjakw1E4ye/2ohEuN3mjr8bIQe1geI0U4AtBDo25sZ7rMdf6EQr+FGmdYYXHQRiiyfdZaD997KX4RmgsZfcTjsL403u740duRxPRnpk6tAD6Pthu1qzVd+ev7oWa/uoq0Z7igLtjlG72HnQuYhmdqDh9V3a4w4RQ6348=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GEkvImgz; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GEkvImgz"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4996f1ee4a4so9852055e9.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 26 Aug 2026 12:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787770983; x=1788375783; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=T2Ai0YOriuHS1IQ7CT4b8R/035xHTVcwVEKbUv9HN3g=;
        b=GEkvImgz1qvD7hqOUYhghwCsVtHsDlpxC2xmH7NBZyqzb0H5n8H2i8Uz66He7NNAe9
         wZS0rRb2oBZuL4ANoEtBmcIxIVA90gFzq7aJrTp9DmFauDIhKhy5E/WaQ/Xl7pmfDGil
         YOPHjGo+5Zz3aTPdwk0C54E0Zkm6uzUeXNCix5tEoyft7jH3CBAsPb3+HCLZEoJj+2An
         LcyVzKIy4DE0D0D7gBsE4/qBt6fy6rmUpJ/Kr0fLjNaTUyut4BIv+je4Rs9snk4VKL+E
         OgxAXHuTbG6UTuWAIq91IwoEEjJA3RW6uUVorPgYq91chYx9Crahd0fUvsaMmYDDTdBO
         Kxsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787770983; x=1788375783;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T2Ai0YOriuHS1IQ7CT4b8R/035xHTVcwVEKbUv9HN3g=;
        b=pnksinPu5sa/D9W39oXvtdXCkWuS7BNaATozr2tjF2v8mtQleXp609dvcb1/OWmSPq
         e43feopo0lnEbZ25jjG4gYc3LThhiKXscXgWEDdFBxO9tIAZGguDcdnRWOHzwaNzWIRS
         CPYgo1oIDBoBRsCBMeJoh9TwRQh2R601Vp596VO/EsUlMwFtDNQBU5pJEB1+VdlC20dk
         aipVYVCAK75OyipQhb/P3H9glbF6Li4wuTekHhJmYlXyi1BwfLEyCJ2wVaR12WYP1opx
         67IKpAnRPhMBRketftgongrweNigvnaqd3Ol541jYDQX3mCs+mJ1TUHclekzMBlLCg2P
         DwzQ==
X-Forwarded-Encrypted: i=1; AHgh+RqowV81XvGcI7eGaJAxoViE0/HlPgRhIq78siKcwb9kWPyUMfpBf4Kb4sU9Akp/xy/eLqilbuh908BmYgLRPa4J0A==@vger.kernel.org
X-Gm-Message-State: AFuF++n5XRSS/Xp6f0Cby5ybK4xbwq1K9N/qkrktSn5YvKFvDSNALfRd
	olA9iWMtBNqz6Uc5otSpvJ1PvtoeSaaIyqbi3+/xOjFHQqAYct1ieX6UogdgFj6fayA=
X-Gm-Gg: AR+sD10e2HKfNsKv/DbwiG7fWv/HwVpcx6Wddv37QQU2tqnqiNPBYlHGYCfWffI+gbD
	EuYJUIab+X2gFTwn0LxoUpwTvZtCVvJq7ZeBcuC9lF842OKMfKliLpishSoopVGdQ0w16BLNVLG
	+yThKcqUKWVcwCHhZeHZ70DgQ/1uwfJePJdJf1MOKej2Day+jZAZ74BhzhjZRZ3g94D1gx88w4E
	Ku6K0XxbbSRh+UdtbzhGG7Ogy5FRNYvRabgzMF7kqbWenz8K/4TL4t5KWReJRmsSwYWgr5lX8eT
	c66C8xjsaz7LSAbChyTGTFw41BkP3LF68Z87n0VagL6DEAJ9fWWzumdw+ClIidaPJ3sEsrwIRLf
	dlvc931sdmPVnT/3drp5kjxoTjTWhWK1OuTxxpCiLsVrALjoGteXJzySGNyyB7b4PE8bMmXyloo
	8ZKKHl4Uv4TQgMimHzfrhRb6cr0sNprWktcTGK6G+Z6ET53iH8XeWv0aeB+JuKD9uNwX3abOoZl
	ikoS3a8deOPYUBlW8mOHDNCLSpo1r6NkvVoKwivW/pRuFCFXp7JbnF3wru2
X-Received: by 2002:a05:600c:190e:b0:499:a277:e8c8 with SMTP id 5b1f17b1804b1-499dc725b50mr82901585e9.13.1787770983326;
        Wed, 26 Aug 2026 12:03:03 -0700 (PDT)
Received: from localhost ([94.4.85.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e27ab4dasm3669437f8f.15.2026.08.26.12.02.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 12:03:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 26 Aug 2026 20:02:59 +0100
Message-Id: <DKZ3X5VUHJSK.1KSJR6K8FATGV@linaro.org>
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Thomas Turner" <tturner@lineageos.org>, "Sam Protsenko"
 <semen.protsenko@linaro.org>
Cc: "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 <krzysztof.kozlowski@oss.qualcomm.com>, <peter.griffin@linaro.org>,
 <alim.akhtar@samsung.com>, <linux-arm-kernel@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-samsung-soc@vger.kernel.org>
Subject: Re: 
X-Mailer: aerc 0.21.0
References: <GVYP280MB12139AB976CA7ACF49FEB768A1A52@GVYP280MB1213.SWEP280.PROD.OUTLOOK.COM> <CAPLW+4kQTUX8QhKnAP7bg=iCw5hhNQZoW7cuOpTdvvAUpGaicg@mail.gmail.com> <135d48e7-58ac-48b8-8fa5-c2548e2f3ae9@lineageos.org>
In-Reply-To: <135d48e7-58ac-48b8-8fa5-c2548e2f3ae9@lineageos.org>

On Tue Aug 25, 2026 at 10:05 PM BST, Thomas Turner wrote:
> Hi Sam and Alexey,
>
> On 19/08/2026 20:51, Sam Protsenko wrote:
>> Can you please tell us a bit about how you tested this patch, and on
>> which board? As DPU is not currently enabled on Exynos850 SoC, I'm not
>> sure how exactly GPU can be useful. If you have a use case or a
>> testing procedure we can run on the E850-96 board, please share.
>>=20
>
> Sam, Alexey could you please test GPU on the E850-96 board by following
> these instructions:
>
> 1) Apply this patch series locally
> 2) Change status=3D"disabled"; to status=3D"okay";
> 3) Make sure these configs are enabled:
> CONFIG_DRM_SIMPLEDRM=3Dy
> CONFIG_DRM_PANFROST=3Dy
> 4) In terms of regulators we set up a basic mali regulator via our
> secondary bootloader [1] and configured with this dts setup [2], NOTE
> you may be able to get away with a dummy regulator so try that first.
> If not I am sure you can replicate something simple with u-boot PMIC.
> 5) Boot a GUI, I saw Debian was used for the bring-up, that should work
> 6) Run the following command:
> $ dmesg | grep "panfrost"
> 7) Compare that to the output at [3]

Your email subject still seems to be null.

[   15.206193] panfrost 11500000.gpu: clock rate =3D 377000000
[   15.206322] panfrost 11500000.gpu: error -ENODEV: _opp_set_regulators: n=
o regulator (mali) found
[   15.206513] panfrost 11500000.gpu: supply mali not found, using dummy re=
gulator
[   15.206840] panfrost 11500000.gpu: mali-g52 id 0x7212 major 0x0 minor 0x=
0 status 0x0
[   15.213137] panfrost 11500000.gpu: features: 00000000,00000df7, issues: =
00000000,00000400
[   15.221271] panfrost 11500000.gpu: Features: L2:0x07100206 Shader:0x0000=
0000 Tiler:0x00000809 Mem:0x1 MMU:0x00002830 AS:0xff JS:0x7
[   15.233080] panfrost 11500000.gpu: shader_present=3D0x1 l2_present=3D0x1
[   15.240488] panfrost 11500000.gpu: [drm] Using Transparent Hugepage
[   15.250497] [drm] Initialized panfrost 1.6.0 for 11500000.gpu on minor 0

[root@e850usb ~]# uname -a
Linux e850usb 7.2.0-next-20260825-00009-g647b48e80572-dirty #8 SMP PREEMPT =
Wed Aug 26 17:05:45 BST 2026 aarch64 GNU/Linux

I have different DRM_SIMPLEDRM options and related  enabled but nothing
pops up via HDMI (at least I tried simple xorg-server things).
Is it possible that your bootloader initilises some framebuffer and inserts
it into DTB that passed to kernel? Or you have some other pieces in
kernel/dt that implement missing functionality?

Here it seems there are no outputs:
[root@e850usb ~]# ls -al /dev/fb*
ls: cannot access '/dev/fb*': No such file or directory

and there no simle framebuffer or related logs. "DPU is not currently
enabled on Exynos850 SoC" looks like the reason.

Panfrost itself seems to be alive though:

[root@e850usb ~]# eglinfo -B
GBM platform:
EGL API version: 1.5
EGL vendor string: Mesa Project
EGL version string: 1.5
EGL client APIs: OpenGL OpenGL_ES
OpenGL core profile vendor: Mesa
OpenGL core profile renderer: Mali-G52 MC1 (Panfrost)
OpenGL core profile version: 3.1 Mesa 26.2.1-arch1.1
OpenGL core profile shading language version: 1.40
OpenGL compatibility profile vendor: Mesa
OpenGL compatibility profile renderer: Mali-G52 MC1 (Panfrost)
OpenGL compatibility profile version: 3.1 Mesa 26.2.1-arch1.1
OpenGL compatibility profile shading language version: 1.40
OpenGL ES profile vendor: Mesa
OpenGL ES profile renderer: Mali-G52 MC1 (Panfrost)
OpenGL ES profile version: OpenGL ES 3.1 Mesa 26.2.1-arch1.1
OpenGL ES profile shading language version: OpenGL ES GLSL ES 3.10

Best regards,
Alexey
