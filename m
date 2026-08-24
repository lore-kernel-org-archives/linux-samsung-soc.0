Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86AD331F986
	for <linux-samsung-soc@vger.kernel.org>; Mon, 24 Aug 2026 10:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=121.127.44.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787567849; cv=none; b=QbhvsbIPZ5kIxNegC9ZnssfVfAPCGiQKNaZEytU+k5tRYMYc7pFhp7Wcxc02kBYdRuIub/N1dGoI5JQ2f70qyxHDWaUJWz1HFQevmNNrZY81fZt2u58s61MPZNmZ9XLoWoq2ecqQ/yfdyIU6WrK7VgRKEhYSd+EKBASo+bkq/QU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787567849; c=relaxed/simple;
	bh=jG1N410v2n0xfaKowcNAWjFTeBnT43Z5RkpSt7FGd2M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kDNHNpOZTLiydeemtkQ3EZqQY326MOHjcHx6kmHHE05MlGd1lVTPaXy9ERUquORIwZUGf+v/cjxktPMEknUiMF4AfkdxB67+1rAe0K0VGLdp1ntVux99IceeaCVeCA8UBaLjABMXof91HYyjDw5n2qLnJy8NWsvigi4PfJQL9ZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lineageos.org; spf=pass smtp.mailfrom=fe-bounces.lineageos.org; dkim=pass (1024-bit key) header.d=lineageos.org header.i=@lineageos.org header.b=ei4378Nj; arc=none smtp.client-ip=121.127.44.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lineageos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.lineageos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lineageos.org header.i=@lineageos.org header.b="ei4378Nj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lineageos.org;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-2eefaa527c; t=1787567841;
 bh=YdYkIXIlftjAnppC8SHjw1JTObFUeSukQACJZ/mcO7Y=;
 b=ei4378Nj9Cj5O00M8lJ4Hdm8nhUMog1iMOuNHREAeCaF8LAp21Y/dV3a9rynSSFmim+0m3aIH
 01nyNOzVh9MY1Jtc2wDTYVRer2bZheaLw02rap33B8DzXGqTjmvGzZq4DNa9NTxGrVt9WKphuvV
 b/Fr2awwV2lWN66T8BXEKrw=
X-Forward-Email-ID: 6a8c1edf8bf58215f74c5bbc
X-Forward-Email-Sender: rfc822; tturner@lineageos.org,
 smtp.forwardemail.net, 121.127.44.73
X-Forward-Email-Version: 2.13.16
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <91a95ba1-504d-41ef-b44f-59408b0939b8@lineageos.org>
Date: Mon, 24 Aug 2026 11:37:15 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] Exynos850 GPU support
To: Sam Protsenko <semen.protsenko@linaro.org>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, peter.griffin@linaro.org
Cc: alim.akhtar@samsung.com, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <GVYP280MB12139AB976CA7ACF49FEB768A1A52@GVYP280MB1213.SWEP280.PROD.OUTLOOK.COM>
 <20260820142330.84514-1-tturner@lineageos.org>
 <88e40f93-ae65-4eb0-827d-9c33c52bad24@oss.qualcomm.com>
 <GVYP280MB1213F9511E062056470AE74AA1A42@GVYP280MB1213.SWEP280.PROD.OUTLOOK.COM>
 <GVYP280MB12134B4DF9D6CA15C7867CF8A1A42@GVYP280MB1213.SWEP280.PROD.OUTLOOK.COM>
 <9c83836b-b4a6-40af-97b1-bbf696258547@kernel.org>
Content-Language: en-GB
From: Thomas Turner <tturner@lineageos.org>
In-Reply-To: <9c83836b-b4a6-40af-97b1-bbf696258547@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

 > Can you please tell us a bit about how you tested this patch, and on
 > which board? As DPU is not currently enabled on Exynos850 SoC, I'm not
 > sure how exactly GPU can be useful. If you have a use case or a
 > testing procedure we can run on the E850-96 board, please share.

I tested this patch by running phosh (PostMarketOS) on the Samsung 
Galaxy A21s device, in my tests logs indicated that the GPU hardware was 
probed successfully and things were working. As for DPU, I simply 
enabled CONFIG_DRM_SIMPLEDRM and that was enough since the bootloader 
configured the related DPU bits. Since I don't own the e850-96 dev board 
myself a testing procedure you could do is.

1) Set status="okay"
2) Enable CONFIG_DRM_SIMPLEDRM and CONFIG_DRM_PANFROST
3) Try and boot some form of GUI and compare logs from dmesg with mine.
4) NOTE: we set up fixed regulators during our testing with some support 
from a secondary bootloader, however it should work with dummy regulators.

 > Would be nice to have a more detailed commit message overall. In
 > addition to the above, it probably makes sense to also discuss current
 > limitations. E.g. thermal, PD, and DVFS, which are enabled in the
 > downstream kernel's GPU node [1].

Yes, I have updated the commit message in v2 of the patch series to be 
more descriptive about what does and does not work, I hope that level of 
detail is sufficient but feel free to point out any sections I may have 
missed.

 > How? The node is disabled.

Not sure if the e850-96 device supports this functionality so for the 
mean time I left it as "disabled", but would be interesting to see if 
Sam or Alexey could test it too.

 > Also, you need to version your patches correctly. This is v2. You also
 > need changelog under ---.

Again, sorry for not including this I am still getting my head around 
the process, but in the v3 of the patch series I will make sure to 
include it.

 > You almost never use this parameter.
 > git format patch; scripts/getmaintainers; git send email

Got it thanks, Sam has been helping me with some of the kernel etiquette 
and procedures in a private thread so hopefully the next patch set 
should be lots clearer :).


One other thing I wanted to ask, do you think it would be best to 
include the logs about the GPU probing in the commit message of v3?

In the next patch version I am going to reword the commit msg to be more 
precise, i.e Add nodes for GPU. Can add more information about how I 
tested it and possibly logs from dmesg.

Cheers,
Tom.
