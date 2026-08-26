Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC6733B05B6
	for <linux-samsung-soc@vger.kernel.org>; Wed, 26 Aug 2026 19:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=121.127.44.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787773887; cv=none; b=uhaIK8BfUxgyEfQczwKltmIBgy9LPrDpHQfcnXGO5sxJcNYPUm7N5YIKZPebgI5L7fRI8dHm3nQCjGJtLQ/qrghlxLyzkcILuIPkmslUhYRDmbn+mF5eCRzt4CBzyupNNMzgS70Ax4Bj5LkEOoExYUL5pFOwAnbCNqFi7eViFBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787773887; c=relaxed/simple;
	bh=ciMaZJFcjYFc+Da0mP+Le2loRZABOtV5XJdSvpXhzgg=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=LyyjQdTyvoFTmzP1SKCNWy+Owp2tUxISelE3+cC0KKeou4nPR4D9G9dj6/UV0LycnMT7AK7D2pzeVfILwWUDo/f1Td3pCkxn93ragYiavwjI8fgGo8/WEI3z/0g+UJhKhjlG0ZMxJerO67oC0TcSAJoqcCpgvarxXIISMXp60VU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lineageos.org; spf=pass smtp.mailfrom=fe-bounces.lineageos.org; dkim=pass (1024-bit key) header.d=lineageos.org header.i=@lineageos.org header.b=YHrpEeFw; arc=none smtp.client-ip=121.127.44.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lineageos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.lineageos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lineageos.org header.i=@lineageos.org header.b="YHrpEeFw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lineageos.org;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: References: Cc:
 To: From: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-2eefaa527c; t=1787773882;
 bh=ciMaZJFcjYFc+Da0mP+Le2loRZABOtV5XJdSvpXhzgg=;
 b=YHrpEeFwo7vUc9Mqu1HT3QdqSEf9gXgiRstNlQ7wZULDnh7Xs4rP9GBWurAWDgkd0Yh2kcD8G
 /6bGwICOK3lBKzd4Vu4DjXqB6tGcAum/Y3sboNpbBRFPLyZXan2lT/Oad8A7pmcm7BVyXhTWals
 FSeZt3RJ+ciFVLqED04SLfY=
X-Forward-Email-ID: 6a8f43b9a86b7caee499143c
X-Forward-Email-Sender: rfc822; tturner@lineageos.org,
 smtp.forwardemail.net, 121.127.44.66
X-Forward-Email-Version: 2.13.16
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <2731b56e-0559-4395-ae92-6940054a053b@lineageos.org>
Date: Wed, 26 Aug 2026 20:51:15 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] Exynos850 GPU support
From: Thomas Turner <tturner@lineageos.org>
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
 <5e8698db-974c-4f8b-8939-bcdf8a47743d@lineageos.org>
Content-Language: en-GB
In-Reply-To: <5e8698db-974c-4f8b-8939-bcdf8a47743d@lineageos.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Forgot to attach the eglinfo -B logs I get in the previous email so here it is:
This is using wayland on phosh UI from [1]


samsung-a21s:~$ eglinfo -B
GBM platform:
EGL API version: 1.5
EGL vendor string: Mesa Project
EGL version string: 1.5
EGL client APIs: OpenGL OpenGL_ES
OpenGL core profile vendor: Mesa
OpenGL core profile renderer: Mali-G52 MC1 (Panfrost)
OpenGL core profile version: 3.1 (Core Profile) Mesa 26.1.6
OpenGL core profile shading language version: 1.40
OpenGL compatibility profile vendor: Mesa
OpenGL compatibility profile renderer: Mali-G52 MC1 (Panfrost)
OpenGL compatibility profile version: 3.1 (Core Profile) Mesa 26.1.6
OpenGL compatibility profile shading language version: 1.40
OpenGL ES profile vendor: Mesa
OpenGL ES profile renderer: Mali-G52 MC1 (Panfrost)
OpenGL ES profile version: OpenGL ES 3.1 Mesa 26.1.6
OpenGL ES profile shading language version: OpenGL ES GLSL ES 3.10

Wayland platform:
EGL API version: 1.5
EGL vendor string: Mesa Project
EGL version string: 1.5
EGL client APIs: OpenGL OpenGL_ES
OpenGL core profile vendor: Mesa
OpenGL core profile renderer: Mali-G52 MC1 (Panfrost)
OpenGL core profile version: 3.1 (Core Profile) Mesa 26.1.6
OpenGL core profile shading language version: 1.40
OpenGL compatibility profile vendor: Mesa
OpenGL compatibility profile renderer: Mali-G52 MC1 (Panfrost)
OpenGL compatibility profile version: 3.1 (Core Profile) Mesa 26.1.6
OpenGL compatibility profile shading language version: 1.40
OpenGL ES profile vendor: Mesa
OpenGL ES profile renderer: Mali-G52 MC1 (Panfrost)
OpenGL ES profile version: OpenGL ES 3.1 Mesa 26.1.6
OpenGL ES profile shading language version: OpenGL ES GLSL ES 3.10

X11 platform:
eglinfo: eglInitialize failed

Surfaceless platform:
EGL API version: 1.5
EGL vendor string: Mesa Project
EGL version string: 1.5
EGL client APIs: OpenGL OpenGL_ES
OpenGL core profile vendor: Mesa
OpenGL core profile renderer: Mali-G52 MC1 (Panfrost)
OpenGL core profile version: 3.1 (Core Profile) Mesa 26.1.6
OpenGL core profile shading language version: 1.40
OpenGL compatibility profile vendor: Mesa
OpenGL compatibility profile renderer: Mali-G52 MC1 (Panfrost)
OpenGL compatibility profile version: 3.1 (Core Profile) Mesa 26.1.6
OpenGL compatibility profile shading language version: 1.40
OpenGL ES profile vendor: Mesa
OpenGL ES profile renderer: Mali-G52 MC1 (Panfrost)
OpenGL ES profile version: OpenGL ES 3.1 Mesa 26.1.6
OpenGL ES profile shading language version: OpenGL ES GLSL ES 3.10

Device platform:
Device #0:

Platform Device platform:
EGL API version: 1.5
EGL vendor string: Mesa Project
EGL version string: 1.5
EGL client APIs: OpenGL OpenGL_ES
OpenGL core profile vendor: Mesa
OpenGL core profile renderer: Mali-G52 MC1 (Panfrost)
OpenGL core profile version: 3.1 (Core Profile) Mesa 26.1.6
OpenGL core profile shading language version: 1.40
OpenGL compatibility profile vendor: Mesa
OpenGL compatibility profile renderer: Mali-G52 MC1 (Panfrost)
OpenGL compatibility profile version: 3.1 (Core Profile) Mesa 26.1.6
OpenGL compatibility profile shading language version: 1.40
OpenGL ES profile vendor: Mesa
OpenGL ES profile renderer: Mali-G52 MC1 (Panfrost)
OpenGL ES profile version: OpenGL ES 3.1 Mesa 26.1.6
OpenGL ES profile shading language version: OpenGL ES GLSL ES 3.10

Device #1:

Platform Device platform:
EGL API version: 1.5
EGL vendor string: Mesa Project
EGL version string: 1.5
EGL client APIs: OpenGL OpenGL_ES
OpenGL core profile vendor: Mesa
OpenGL core profile renderer: llvmpipe (LLVM 22.1.8, 128 bits)
OpenGL core profile version: 4.6 (Core Profile) Mesa 26.1.6
OpenGL core profile shading language version: 4.60
OpenGL compatibility profile vendor: Mesa
OpenGL compatibility profile renderer: llvmpipe (LLVM 22.1.8, 128 bits)
OpenGL compatibility profile version: 4.6 (Compatibility Profile) Mesa 26.1.6
OpenGL compatibility profile shading language version: 4.60
OpenGL ES profile vendor: Mesa
OpenGL ES profile renderer: llvmpipe (LLVM 22.1.8, 128 bits)
OpenGL ES profile version: OpenGL ES 3.2 Mesa 26.1.6
OpenGL ES profile shading language version: OpenGL ES GLSL ES 3.20

Regards,
Tom

[1] https://wiki.postmarketos.org/wiki/Phosh
