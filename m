Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB3D251E420
	for <linux-samsung-soc@vger.kernel.org>; Mon,  7 Sep 2026 17:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=121.127.44.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788803251; cv=none; b=eskPhVUbQBo7dmN82oAA0gCzd/A3Ji5Cbmr5ybsKCT9I20UvwoR4kGyKP/lnvHNv3/w/iX7SDTHA6AzvhuVe+C743/o/AoYfH3mP6CiGbNJMK8fWVefLYtGTKW5hFjLLx0m7HdDekJJKs5gHfmSTqVQRvKv4FF9OYPTgnvi6Mis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788803251; c=relaxed/simple;
	bh=CQtqFLMRUcTx0dj7FUe3b3albQBIDJiu1m58tOlomAQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nHe0Co1Ub2bztZmxnrEkwR5K90C0Wm82zy7ULuDMMYt7nrZkdQ5FVa+YRVc16xn3JAny5POn8tUSGQnd2gFB4wmRDBd70Q9b5nyUWboZa24Cp5w4CoS2iKSeKxc3UPZ0gvGzlYCDlyYp7hrOuRXAm8wkbiQ1H+U8MEY5Gxam1FM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lineageos.org; spf=pass smtp.mailfrom=fe-bounces.lineageos.org; dkim=pass (1024-bit key) header.d=lineageos.org header.i=@lineageos.org header.b=wfpKBPEy; arc=none smtp.client-ip=121.127.44.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lineageos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.lineageos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lineageos.org header.i=@lineageos.org header.b="wfpKBPEy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lineageos.org;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-2eefaa527c; t=1788803248;
 bh=pulCHBNmHSLCMLUfuycAkgDBmy2iXM7iw4tKHzxTz4I=;
 b=wfpKBPEyc9kgAhnxYkBPpUcRSWSFnVRMRR6h1aoI4f+a7MhUrS3dTO4EtTYVlavZuP7CicQSw
 7y1YZkoQxc1BJIoKJo2xEU81NbWaw+JGmXxWWFJF6wa6O/1O9rG2Fce0ydMTUyPcNOTqLuWR8os
 2NdeouD/liO2x55zOfh1SSk=
X-Forward-Email-ID: 6a9ef8afe1a2da1fc80b68a4
X-Forward-Email-Sender: rfc822; tturner@lineageos.org,
 smtp.forwardemail.net, 121.127.44.73
X-Forward-Email-Version: 2.14.2
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <45014ba7-e213-4624-be45-78e88c1b52a0@lineageos.org>
Date: Mon, 7 Sep 2026 18:47:23 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: exynos: Add GPU/Mali Bifrost node to
 Exynos850
To: Alexey Klimov <alexey.klimov@linaro.org>, semen.protsenko@linaro.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 peter.griffin@linaro.org
Cc: alim.akhtar@samsung.com, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, thomas_turner@talktalk.net
References: <20260905170914.1640-1-tturner@lineageos.org>
 <20260905170914.1640-3-tturner@lineageos.org>
 <DL8NQGNAVSYK.18TYE03LPQSW5@linaro.org>
Content-Language: en-GB
From: Thomas Turner <tturner@lineageos.org>
In-Reply-To: <DL8NQGNAVSYK.18TYE03LPQSW5@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Alexey,

On 07/09/2026 01:28, Alexey Klimov wrote:
> On Sat Sep 5, 2026 at 6:09 PM BST, Thomas Turner wrote:
>> Add nodes for GPU (Mali Bifrost) to Exynos850. Does not provide support
>> for temperature throttling, DVFS, power domains, governor support,
> 
> One of the sensors exposed via ACPM is "linked" to the GPU/G3D as far as
> I know. The driver part was sent already and three sensors work there
> (two cpu clusters and GPU).
> 
> I've never tested yet the DVFS of G3D via ACPM. Maybe it is worth a try
> on A21s. But it should work the same way as clusters clocks.
> 

I have had a little look at your ACPM stuff currently staged, looks like 
some really good work, would be cool to see if we could get dvfs working 
via acpm at some point :D.

>> boosting and voltage control. Once PMIC is properly implemented, support
>> will hopefully increase. However, the panfrost driver probes, the
>> Mali-G52 GPU initializes and the core clock is set-up.
>>
>> Testing for this patch was done on a device not currently supported by
>> linux, the Galaxy A21s. After enabling this node for that device
>> locally, I was able to test and confirm basic GPU functionality. As of
>> now, this patch has no users which have tested GPU capabilities and so
>> the node has been set to "disabled".
>>
>> Here are some logs I pulled:
>>
>> panfrost 11500000.gpu: clock rate = 377000000
>> panfrost 11500000.gpu: mali-g52 id 0x7212 major 0x0 minor 0x0 status 0x0
>> panfrost 11500000.gpu: features: 00000000,00000df7, issues: 00000000,00000400
>> panfrost 11500000.gpu: Features: L2:0x07100206 Shader:0x00000000 Tiler:0x00000809 Mem:0x1 MMU:0x00002830 AS:0xff JS:0x7
>> panfrost 11500000.gpu: shader_present=0x1 l2_present=0x1
>> panfrost 11500000.gpu: [drm] Using Transparent Hugepage
>> [drm] Initialized panfrost 1.6.0 for 11500000.gpu on minor 0
>>
>> OpenGL core profile vendor: Mesa
>> OpenGL core profile renderer: Mali-G52 MC1 (Panfrost)
>> OpenGL core profile version: 3.1 (Core Profile) Mesa 26.1.6
>> OpenGL core profile shading language version: 1.40
>> OpenGL compatibility profile vendor: Mesa
>> OpenGL compatibility profile renderer: Mali-G52 MC1 (Panfrost)
>> OpenGL compatibility profile version: 3.1 (Core Profile) Mesa 26.1.6
>> OpenGL compatibility profile shading language version: 1.40
>> OpenGL ES profile vendor: Mesa
>> OpenGL ES profile renderer: Mali-G52 MC1 (Panfrost)
>> OpenGL ES profile version: OpenGL ES 3.1 Mesa 26.1.6
>> OpenGL ES profile shading language version: OpenGL ES GLSL ES 3.10
>>
>> Signed-off-by: Thomas Turner <tturner@lineageos.org>
> 
> So, I've got A21s and installed pmOS to test all that.
> My logs are slightly different but graphics is definitely alive:
> [    0.200787] [drm] Initialized simpledrm 1.0.0 for fa000000.framebuffer on minor 0
> [    0.215130] Console: switching to colour frame buffer device 90x100
> [    0.225540] simple-framebuffer fa000000.framebuffer: [drm] fb0: simpledrmdrmfb frame buffer device
> [    0.226134] panfrost 11500000.gpu: clock rate = 377000000
> [    0.230960] panfrost 11500000.gpu: mali-g52 id 0x7212 major 0x0 minor 0x0 status 0x0
> [    0.230981] panfrost 11500000.gpu: features: 00000000,00000df7, issues: 00000000,00000400
> [    0.230991] panfrost 11500000.gpu: Features: L2:0x07100206 Shader:0x00000000 Tiler:0x00000809 Mem:0x1 MMU:0x00002830 AS:0xff JS:0x7
> [    0.231002] panfrost 11500000.gpu: shader_present=0x1 l2_present=0x1
> [    0.232329] panfrost 11500000.gpu: [drm] Using Transparent Hugepage
> [    0.232726] [drm] Initialized panfrost 1.6.0 for 11500000.gpu on minor 1
> 
> Also, when this is applied with status="okay" on Winlink board then
> panfrost itself seems to be alive and drm initialises despite missing
> regulator as indicated in my other email in v2 of this series, hence:

Alright cool, just for the records we have tested this series on the 
A21s both with and without proper regulators and GPU seems to work fine 
with dummy regs.

> Reviewed-and-tested-by: Alexey Klimov <alexey.klimov@linaro.org>
> 

Cheers, will give this version a few days to stew then I will add this 
onto v4.

> Thanks for working on this.
> Best regareds,
> Alexey

I really appreciate all of the testing and insight you have provided in 
the last few messages, now that we have Samsung E850s booting I hope to 
expand support across the whole SoC :D.

Cheers,
Tom
