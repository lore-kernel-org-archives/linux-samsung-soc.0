Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3435481673
	for <linux-samsung-soc@vger.kernel.org>; Wed, 26 Aug 2026 19:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=149.28.215.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787773472; cv=none; b=RzKfHRLwsHht4N8LFO4SELgHtugGrAhyY2GJBTa3yvPQCuObTtNFCbBorF4jtr9AxWiHYyFTkEg3dSF1a0TOp3IAFrOyBvFK9rH7iR2+2KICHUXlef1rB610Zko1OaLfR66sjFvG6YI/f+GNuOQnLyA2oCu84R7R/NaIqbnykY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787773472; c=relaxed/simple;
	bh=3Lf9y9WdRvoy6ilEzqJ0+PzwDgYt6Q/us2hkH0kxrH8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b0Yhl4brpmzZCGjtiXiMPyzl6MHM/gFP2WwGMX9eqLNPibVY15t6KdoesjLx9oDDYLlC50sjTUNoasTil/kihl4zACxwhVyxQMeC/rWcUJ8vhr5WWCE3rA4Z6s4Ep4PiFsTsZOJzAibdxeobrX3WAXEOx9+dcRUUDa5bRvsxqLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lineageos.org; spf=pass smtp.mailfrom=fe-bounces.lineageos.org; dkim=pass (1024-bit key) header.d=lineageos.org header.i=@lineageos.org header.b=F1u2MguY; arc=none smtp.client-ip=149.28.215.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lineageos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.lineageos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lineageos.org header.i=@lineageos.org header.b="F1u2MguY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lineageos.org;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-2eefaa527c; t=1787773451;
 bh=PGuBe6Xxv/7LYE3cIlxPiI6vCF8iwOw4R1p9fKhoQdw=;
 b=F1u2MguY2JhOe20eX+h0rvanCw2L7MJv+avLlIJfYOoHm6Tzit405bDAuEkzdznEVyXOT0yVR
 4gMdZPp9Or+246Zgh4hSEAyCxHP0t+kC19FaNwxgh4hgk3WPxPmmJRtXKFkCVEviRVHno6qRo/v
 V9agKa3fXJfXp61xZWg8dE4=
X-Forward-Email-ID: 6a8f4202150ee80826965353
X-Forward-Email-Sender: rfc822; tturner@lineageos.org,
 smtp.forwardemail.net, 149.28.215.223
X-Forward-Email-Version: 2.13.16
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <5e8698db-974c-4f8b-8939-bcdf8a47743d@lineageos.org>
Date: Wed, 26 Aug 2026 20:43:56 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] Exynos850 GPU support
To: Alexey Klimov <alexey.klimov@linaro.org>,
 Sam Protsenko <semen.protsenko@linaro.org>
Cc: "robh@kernel.org" <robh@kernel.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 krzysztof.kozlowski@oss.qualcomm.com, peter.griffin@linaro.org,
 alim.akhtar@samsung.com, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org
References: <GVYP280MB12139AB976CA7ACF49FEB768A1A52@GVYP280MB1213.SWEP280.PROD.OUTLOOK.COM>
 <CAPLW+4kQTUX8QhKnAP7bg=iCw5hhNQZoW7cuOpTdvvAUpGaicg@mail.gmail.com>
 <135d48e7-58ac-48b8-8fa5-c2548e2f3ae9@lineageos.org>
 <DKZ3X5VUHJSK.1KSJR6K8FATGV@linaro.org>
Content-Language: en-GB
From: Thomas Turner <tturner@lineageos.org>
In-Reply-To: <DKZ3X5VUHJSK.1KSJR6K8FATGV@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26/08/2026 20:02, Alexey Klimov wrote:
> On Tue Aug 25, 2026 at 10:05 PM BST, Thomas Turner wrote:
>> Hi Sam and Alexey,
>>
>> On 19/08/2026 20:51, Sam Protsenko wrote:
>>> Can you please tell us a bit about how you tested this patch, and on
>>> which board? As DPU is not currently enabled on Exynos850 SoC, I'm not
>>> sure how exactly GPU can be useful. If you have a use case or a
>>> testing procedure we can run on the E850-96 board, please share.
>>>
>>
>> Sam, Alexey could you please test GPU on the E850-96 board by following
>> these instructions:
>>
>> 1) Apply this patch series locally
>> 2) Change status="disabled"; to status="okay";
>> 3) Make sure these configs are enabled:
>> CONFIG_DRM_SIMPLEDRM=y
>> CONFIG_DRM_PANFROST=y
>> 4) In terms of regulators we set up a basic mali regulator via our
>> secondary bootloader [1] and configured with this dts setup [2], NOTE
>> you may be able to get away with a dummy regulator so try that first.
>> If not I am sure you can replicate something simple with u-boot PMIC.
>> 5) Boot a GUI, I saw Debian was used for the bring-up, that should work
>> 6) Run the following command:
>> $ dmesg | grep "panfrost"
>> 7) Compare that to the output at [3]
> 
> Your email subject still seems to be null.
> 
> [   15.206193] panfrost 11500000.gpu: clock rate = 377000000
> [   15.206322] panfrost 11500000.gpu: error -ENODEV: _opp_set_regulators: no regulator (mali) found
> [   15.206513] panfrost 11500000.gpu: supply mali not found, using dummy regulator
> [   15.206840] panfrost 11500000.gpu: mali-g52 id 0x7212 major 0x0 minor 0x0 status 0x0
> [   15.213137] panfrost 11500000.gpu: features: 00000000,00000df7, issues: 00000000,00000400
> [   15.221271] panfrost 11500000.gpu: Features: L2:0x07100206 Shader:0x00000000 Tiler:0x00000809 Mem:0x1 MMU:0x00002830 AS:0xff JS:0x7
> [   15.233080] panfrost 11500000.gpu: shader_present=0x1 l2_present=0x1
> [   15.240488] panfrost 11500000.gpu: [drm] Using Transparent Hugepage
> [   15.250497] [drm] Initialized panfrost 1.6.0 for 11500000.gpu on minor 0

You seemed to have missed out step (4) of my instructions, if you set-up
regulators correctly this error will disappear.

> [root@e850usb ~]# uname -a
> Linux e850usb 7.2.0-next-20260825-00009-g647b48e80572-dirty #8 SMP PREEMPT Wed Aug 26 17:05:45 BST 2026 aarch64 GNU/Linux
> 
> I have different DRM_SIMPLEDRM options and related  enabled but nothing
> pops up via HDMI (at least I tried simple xorg-server things).
> Is it possible that your bootloader initilises some framebuffer and inserts
> it into DTB that passed to kernel? Or you have some other pieces in
> kernel/dt that implement missing functionality?

Our bootloader does intialise a framebuffer, and we have a node in our device
tree which makes it usable. Not sure how exactly the e850-96 device sets
things up but you can take a look at our fork if you want, [1].

> Here it seems there are no outputs:
> [root@e850usb ~]# ls -al /dev/fb*
> ls: cannot access '/dev/fb*': No such file or directory
> 
> and there no simle framebuffer or related logs. "DPU is not currently
> enabled on Exynos850 SoC" looks like the reason.

hm, I am pretty sure our bootloader configures DPU for us so that might be
why it works for us and not for you.

> Panfrost itself seems to be alive though:
> 
> [root@e850usb ~]# eglinfo -B
> GBM platform:
> EGL API version: 1.5
> EGL vendor string: Mesa Project
> EGL version string: 1.5
> EGL client APIs: OpenGL OpenGL_ES
> OpenGL core profile vendor: Mesa
> OpenGL core profile renderer: Mali-G52 MC1 (Panfrost)
> OpenGL core profile version: 3.1 Mesa 26.2.1-arch1.1
> OpenGL core profile shading language version: 1.40
> OpenGL compatibility profile vendor: Mesa
> OpenGL compatibility profile renderer: Mali-G52 MC1 (Panfrost)
> OpenGL compatibility profile version: 3.1 Mesa 26.2.1-arch1.1
> OpenGL compatibility profile shading language version: 1.40
> OpenGL ES profile vendor: Mesa
> OpenGL ES profile renderer: Mali-G52 MC1 (Panfrost)
> OpenGL ES profile version: OpenGL ES 3.1 Mesa 26.2.1-arch1.1
> OpenGL ES profile shading language version: OpenGL ES GLSL ES 3.10
> 
> Best regards,
> Alexey

Best Regards,
Tom

[1] https://github.com/samsungexynos850/linux/commits/master

