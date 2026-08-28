Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9807F3B2FCE
	for <linux-samsung-soc@vger.kernel.org>; Fri, 28 Aug 2026 09:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787909759; cv=pass; b=kkCK2dbN6AjkkrYIqrfukkocUg//0g+X4Bdi7k/4JdG7hYWAKacfhsut5euFZNFLFQ+9CyKWNEEpoUOAT2hijrNpezClB8gP6qUnHfl9tFEcHrhetAHoS1X/IBmY8QPfzf7e3CfvyCOS3FI/navv15i3efQjH0lb9AWRBk9T2bk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787909759; c=relaxed/simple;
	bh=op/7X2g33Wg5cOt/DZ/YOuYArMzVztGV0ScGuTiCS2Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HV+jGB332euVeQKtbXJ6fEMLhLXCHrhQs+pWEGq8LqKAYgxDD01I5F4AsnS5b0R2BJ9cEaTOtUOzz98Hyc4U8CXGzW31cdAUlQ1Xw7tnUclDDbt1/Dv/07NBVgeZ8/jlZkH3mzkDmjQlMjbG20FktYbhmDYDUik07L4nBevD/zw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vZxUgplX; arc=pass smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vZxUgplX"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6a0a4aa99bdso992232a12.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 28 Aug 2026 02:35:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787909748; cv=none;
        d=google.com; s=arc-20260327;
        b=dybioykmVNCJqj8pvBHT4BZmyxaUVL8zepBxarMnWvKaqkXkfCL6mVcCC+ZXCqLe99
         /4QDNXV2ChkhHPWiijY+glWUiQBxlNomFcj9QQmEW2QNrj2oTNSy3H8tGQvt/lXrM4TV
         Jg5XIschLOtrEfiaqUBQFgT0NKZoXF0xyW6rU4Us99k6FNDH1YkryyzgGXdhOvus3i9v
         K6sGXlK6EaPDW0GyVVmXM9lKLh8Iw1yf3wyYCSzOMUjeOU+qEErhL2Jh5OklN3lvV345
         OmeKzBwKnd071s2bzFStyS8b5S56PPdhzV31aDMXFV0vMxtrhw3Rmt/iuMBSfsyMyOpK
         lTww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=M4mRPyxUwh4SLKG3nAkInA2mLQaoHKjEcd3Lko4Y3NE=;
        fh=kiK0JaX4jKqnDJO4rcfJS7V43E2tht8y10XQkSBPUs8=;
        b=HNnD5BTlUUrqy7UNclLhKgXYlI+2LT4YQSFK3PK3BIZqvCrC0ufH3PPS9Plichum3i
         jc+34u7aJDOmhSe3hUG7C9i1V/E03pSQVTh2gTjJ95VbD4mvO6PRf07gFNpKlK1VSNHd
         GomernCTtRpUk2qcFhhBcPr9g9uMVeXPQWMqXtrM3IsttMtvFPE1V5y4WdwTd6aMm6sJ
         5Ju3E+ITyFbkiBv/EVlUvzWeZfQqhW1jRBMHBTxg+L8hAvaa33TRWRgTiP1I3vECLyHZ
         UuiMYiaW8MdXSajajL+eWLx5L1O5q7b9DuirjP6noQFrQK2V09b5j/nWIcu5UDB1t63A
         253Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787909748; x=1788514548; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M4mRPyxUwh4SLKG3nAkInA2mLQaoHKjEcd3Lko4Y3NE=;
        b=vZxUgplXuNqyOSSqGHTld1AzsEuwVH3K32aLdJbdooxphxF6gU8a84W4wm3+/ypTZf
         1PaT0FQ49qrxO20nCkss2xCGca1KoX/AM/ytCS284NcJQ6voiouwnZUGs+1R9gNIoqkO
         GBL6wAdVWlXe8zR6wi4MwYvRuIR2Q+Yc68wPxTNy9myTnTzKdXb3uF9LKtBK4yz2NPMO
         59Ps36+TEdFhUZQnXRaQT3gAlRiMr0yj6Vr5JTRG46DL2y2lYPHcmMOO82Xp89FL32f3
         aU8WTBGULujvu5L5bVsi0QpsTwMiOSEKqmrcZW1ueZjq2JNM0jmKLpIAeObs+j3zbKsC
         f13w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787909748; x=1788514548;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=M4mRPyxUwh4SLKG3nAkInA2mLQaoHKjEcd3Lko4Y3NE=;
        b=OdA/YNdf8NPWhCgcKJfKv4GDcQDJg0r875T2rqt6PHsnt9plAmqWs0XdQ61+AEW7pr
         sL+ra7yCNmVpB64h1uowmOe3BMbrkPvVojwVb3UnhKwmdr8INYQKiJDmCmfDVykna1w7
         6cb4l/Z8V3/tXnwFMFScIhcCwE4Tl9AGlNtQQs3/t/7R1TKX+gUNxUBltmT6cEG5TGvA
         ipjMgWl/xMzMxJQUhJmuRUxCwnNbnn03rJrOU7S8P5S4nvuAPPKdNfM5IHOScRiV1q3G
         BCA6oLVIOg5mC1bDJ7Fi/4x88wiiLgBjPd46xJkKa6GBekqeNXUsKTlxg+PKcQ73iyp8
         6vrg==
X-Forwarded-Encrypted: i=1; AHgh+Rp2CgtP8SdtadfSjlsj7TMiIoxKE/TnJ/5LkPsN0reIn613UA4ayFSF7g8oMMWwi0fTfF4rvlbRVWjoT4WmQbyysg==@vger.kernel.org
X-Gm-Message-State: AFuF++l3OBor0GiZc6frQtUBylOfy0KujSKgBCQaom5plht/lJyQvoWb
	jMhv9K/ac4Cf5Vne3v8gwjKs9dMLFcvNr/zDUVm6K56anS/zNSBKsmtE8TapJH4DgJqDXFJi/0t
	oSn7u3o2ze3ngGRBicSbyiYYg0sHVpsjAitH8dMgPIg==
X-Gm-Gg: AR+sD12sXDF5UvyyFE9yJnP9fbecUrCf8FNwI+JvdVFGRBC95+GH3O7nrk4ifbw6eyw
	bvEeAIuh/q7vUWupZhzKGaGiPfTEb3BX5groGsnG/E3Or3A5pCdyDSfLaiPChqPBvdH7M4s0NJr
	RoM9hjaGPIO9ZQI0Ea+/BBtsie8nipaOJGhRj5osaxoFaukvkV6kvjqgZ8b5dh7xQ5mI+8qHvRm
	Z3a/12FiBkBdaA+8ZNvBgNEvZZPizrwyvZwdwWpTy3nwbjVsJoUT9P2DpuHIuf+Hd+BVo0xn+oN
	F/PX/KN/fOVekP2j2+H+MekpaOURJfXBesVBCr62zCZLeC5ESWPQk3fCBsWm3t+RwmCTD3jfEEj
	Fesk=
X-Received: by 2002:a05:6402:3807:b0:6a5:f528:ff48 with SMTP id
 4fb4d7f45d1cf-6a60d35736cmr3469549a12.5.1787909747586; Fri, 28 Aug 2026
 02:35:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <GVYP280MB12139AB976CA7ACF49FEB768A1A52@GVYP280MB1213.SWEP280.PROD.OUTLOOK.COM>
 <CAPLW+4kQTUX8QhKnAP7bg=iCw5hhNQZoW7cuOpTdvvAUpGaicg@mail.gmail.com>
 <135d48e7-58ac-48b8-8fa5-c2548e2f3ae9@lineageos.org> <DKZ3X5VUHJSK.1KSJR6K8FATGV@linaro.org>
 <5e8698db-974c-4f8b-8939-bcdf8a47743d@lineageos.org>
In-Reply-To: <5e8698db-974c-4f8b-8939-bcdf8a47743d@lineageos.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 28 Aug 2026 10:35:36 +0100
X-Gm-Features: AcwNN1WeoYWQnW4gSKiWJkUeMJcl_oJic8RHhz9v0tzgpLotvnyYe_l98Rtu_To
Message-ID: <CADrjBPrhaQHyQX-+FEHYH5rCwh9_fMUVsV5fpvRkR-RF_9Erkg@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Exynos850 GPU support
To: Thomas Turner <tturner@lineageos.org>
Cc: Alexey Klimov <alexey.klimov@linaro.org>, Sam Protsenko <semen.protsenko@linaro.org>, 
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>, 
	"conor+dt@kernel.org" <conor+dt@kernel.org>, krzysztof.kozlowski@oss.qualcomm.com, 
	alim.akhtar@samsung.com, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Thomas, Alexey, Sam

On Wed, 26 Aug 2026 at 20:44, Thomas Turner <tturner@lineageos.org> wrote:
>
> On 26/08/2026 20:02, Alexey Klimov wrote:
> > On Tue Aug 25, 2026 at 10:05 PM BST, Thomas Turner wrote:
> >> Hi Sam and Alexey,
> >>
> >> On 19/08/2026 20:51, Sam Protsenko wrote:
> >>> Can you please tell us a bit about how you tested this patch, and on
> >>> which board? As DPU is not currently enabled on Exynos850 SoC, I'm not
> >>> sure how exactly GPU can be useful. If you have a use case or a
> >>> testing procedure we can run on the E850-96 board, please share.
> >>>
> >>
> >> Sam, Alexey could you please test GPU on the E850-96 board by following
> >> these instructions:
> >>
> >> 1) Apply this patch series locally
> >> 2) Change status="disabled"; to status="okay";
> >> 3) Make sure these configs are enabled:
> >> CONFIG_DRM_SIMPLEDRM=y
> >> CONFIG_DRM_PANFROST=y
> >> 4) In terms of regulators we set up a basic mali regulator via our
> >> secondary bootloader [1] and configured with this dts setup [2], NOTE
> >> you may be able to get away with a dummy regulator so try that first.
> >> If not I am sure you can replicate something simple with u-boot PMIC.
> >> 5) Boot a GUI, I saw Debian was used for the bring-up, that should work
> >> 6) Run the following command:
> >> $ dmesg | grep "panfrost"
> >> 7) Compare that to the output at [3]
> >
> > Your email subject still seems to be null.
> >
> > [   15.206193] panfrost 11500000.gpu: clock rate = 377000000
> > [   15.206322] panfrost 11500000.gpu: error -ENODEV: _opp_set_regulators: no regulator (mali) found
> > [   15.206513] panfrost 11500000.gpu: supply mali not found, using dummy regulator
> > [   15.206840] panfrost 11500000.gpu: mali-g52 id 0x7212 major 0x0 minor 0x0 status 0x0
> > [   15.213137] panfrost 11500000.gpu: features: 00000000,00000df7, issues: 00000000,00000400
> > [   15.221271] panfrost 11500000.gpu: Features: L2:0x07100206 Shader:0x00000000 Tiler:0x00000809 Mem:0x1 MMU:0x00002830 AS:0xff JS:0x7
> > [   15.233080] panfrost 11500000.gpu: shader_present=0x1 l2_present=0x1
> > [   15.240488] panfrost 11500000.gpu: [drm] Using Transparent Hugepage
> > [   15.250497] [drm] Initialized panfrost 1.6.0 for 11500000.gpu on minor 0
>
> You seemed to have missed out step (4) of my instructions, if you set-up
> regulators correctly this error will disappear.
>
> > [root@e850usb ~]# uname -a
> > Linux e850usb 7.2.0-next-20260825-00009-g647b48e80572-dirty #8 SMP PREEMPT Wed Aug 26 17:05:45 BST 2026 aarch64 GNU/Linux
> >
> > I have different DRM_SIMPLEDRM options and related  enabled but nothing
> > pops up via HDMI (at least I tried simple xorg-server things).
> > Is it possible that your bootloader initilises some framebuffer and inserts
> > it into DTB that passed to kernel? Or you have some other pieces in
> > kernel/dt that implement missing functionality?
>
> Our bootloader does intialise a framebuffer, and we have a node in our device
> tree which makes it usable. Not sure how exactly the e850-96 device sets
> things up but you can take a look at our fork if you want, [1].
>
> > Here it seems there are no outputs:
> > [root@e850usb ~]# ls -al /dev/fb*
> > ls: cannot access '/dev/fb*': No such file or directory
> >
> > and there no simle framebuffer or related logs. "DPU is not currently
> > enabled on Exynos850 SoC" looks like the reason.
>
> hm, I am pretty sure our bootloader configures DPU for us so that might be
> why it works for us and not for you.

@Alexey - I think the LK bootloader leaves DPU framebuffer updates off
to ensure a seamless handover from the bootsplash to the full DRM
driver. We have the following DPU poke in gs101 (which if I recall
correctly we got the inspiration for this from uniloader)
https://gitlab.com/LinaroLtd/googlelt/meta-bsp-google-gs/-/commit/4057117e4bc6e08fbb6ff281cbfef8782a68ec0a

So for the E850 board, you likely need to do something similar, either
in LK or like the above poke. If UniLoader is already doing this for
the e850 SoC then hopefully you can check there to see the address of
the register etc. That should then able you to have simple-framebuffer
enabled.

>
> > Panfrost itself seems to be alive though:
> >
> > [root@e850usb ~]# eglinfo -B
> > GBM platform:
> > EGL API version: 1.5
> > EGL vendor string: Mesa Project
> > EGL version string: 1.5
> > EGL client APIs: OpenGL OpenGL_ES
> > OpenGL core profile vendor: Mesa
> > OpenGL core profile renderer: Mali-G52 MC1 (Panfrost)
> > OpenGL core profile version: 3.1 Mesa 26.2.1-arch1.1
> > OpenGL core profile shading language version: 1.40
> > OpenGL compatibility profile vendor: Mesa
> > OpenGL compatibility profile renderer: Mali-G52 MC1 (Panfrost)
> > OpenGL compatibility profile version: 3.1 Mesa 26.2.1-arch1.1
> > OpenGL compatibility profile shading language version: 1.40
> > OpenGL ES profile vendor: Mesa
> > OpenGL ES profile renderer: Mali-G52 MC1 (Panfrost)
> > OpenGL ES profile version: OpenGL ES 3.1 Mesa 26.2.1-arch1.1
> > OpenGL ES profile shading language version: OpenGL ES GLSL ES 3.10

That's really cool!

Peter.
