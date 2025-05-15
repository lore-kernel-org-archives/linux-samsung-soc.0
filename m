Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AB0817B4EC
	for <linux-samsung-soc@vger.kernel.org>; Thu, 15 May 2025 14:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747319259; cv=none; b=aTgSQYt8dyMarn5sk/YcbHnAfmFflPwdjWF70ebS2MEvn5dC2F+VR5eYpmtwbFzgBDX5+ixVzebQkPVRQX4W/LI//0zh8Cbz940CqE7PmAx8HwPbQrJswY3S6WioKjZ1Tt18wDPOUiW08+TpfViR28Ci5s9WoJs7GsjUgj9wc08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747319259; c=relaxed/simple;
	bh=4pgWXPFF4dO5j5XyrOv14vAHpJ4O49nfm35Y0Nv32ko=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=U+TllKJ9JLQ3z47WFs1rXKjVz1tBK0UFxBA7HaO0sh8NSRoNCfcUB3jSXBmanPWDopsPSVK7S2x9WnwCga7Z+yLvBojmLCnUA2hNkwg6nvp6CGEfiPvF1S3LgZWYeBy7LxtCN8yf3D2S7E83uPrja8fhvQs/vOY160GDcz8UcXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org; spf=pass smtp.mailfrom=mentallysanemainliners.org; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=ZFZILwmD; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="ZFZILwmD"
DKIM-Signature: a=rsa-sha256; b=ZFZILwmD7YC334uJWUSSaoozvnAwB/bun/UY/j4LOLszgSK7nHJHQv5OWtnsgllixenYRk9hnWg8nMlTXhGqtTh0cLgvDYwBceYvZdCPcMMBsZkQWGM4aLSfp+KHoPkcyJC/WP9LPp0Gu9b+lTP/qCKs81AWEMZUAzCwdDBlDo3zqO1teVBRUTU2hCagpLUl/jCUk5pBPZxZQNXSdjTJzuZlGtK0JBwFgkNEd/YR5CpElj31YM00Mw1sGjJ4I56jp+tNZQ7yf33ugvNPxxsJREEY9bvrR7zRqm12VM/BLoTtKRw/Xb0/C8aVOZhzx+t2ZS7+Ecrww4fd3pdzmEJt9g==; s=purelymail1; d=purelymail.com; v=1; bh=4pgWXPFF4dO5j5XyrOv14vAHpJ4O49nfm35Y0Nv32ko=; h=Feedback-ID:Received:Date:Subject:From:To;
Feedback-ID: 68247:10037:null:purelymail
X-Pm-Original-To: linux-samsung-soc@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1592338441;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Thu, 15 May 2025 14:26:53 +0000 (UTC)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 15 May 2025 16:26:48 +0200
Message-Id: <D9WSYR0CJUC1.3RCB16LZ3S6P7@mentallysanemainliners.org>
Cc: "Kishon Vijay Abraham I" <kishon@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Marek Szyprowski"
 <m.szyprowski@samsung.com>, "Sylwester Nawrocki" <s.nawrocki@samsung.com>,
 "Alim Akhtar" <alim.akhtar@samsung.com>, <linux-phy@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-samsung-soc@vger.kernel.org>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 0/2] USB PHY support for Exynos990 SoCs
From: "Igor Belwon" <igor.belwon@mentallysanemainliners.org>
To: "Krzysztof Kozlowski" <krzk@kernel.org>, "Vinod Koul" <vkoul@kernel.org>
X-Mailer: aerc 0.20.0
References: <20250420-usb-resends-april-v2-0-25dc7d2e6dd4@mentallysanemainliners.org> <aCRXgpD0Ld2W4lHE@vaman> <D9VYC98LJTR0.LJXYC1H0BAKA@mentallysanemainliners.org> <aCWj4cn4y+RyfGiZ@vaman> <ea1a7a37-031f-4f81-ba09-eaa523f70761@kernel.org>
In-Reply-To: <ea1a7a37-031f-4f81-ba09-eaa523f70761@kernel.org>

On Thu May 15, 2025 at 11:14 AM CEST, Krzysztof Kozlowski wrote:
> On 15/05/2025 10:20, Vinod Koul wrote:
>> On 14-05-25, 16:26, Igor Belwon wrote:
>>> On Wed May 14, 2025 at 10:42 AM CEST, Vinod Koul wrote:
>>>> On 20-04-25, 21:28, Igor Belwon wrote:
>>>>> Hi all!
>>>>>
>>>>> This patchset adds support for the USB 2.0 PHY of the Exynos990 SoC.
>>>>> This SoC has a combo PHY that supports highspeed, superspeed USB and
>>>>> DisplayPort, however due to my inability to test the superspeed part =
of
>>>>> the combo phy (device always enumerated as high-speed, even on the
>>>>> vendor kernels/bootloaders) only the highspeed part is brought up.
>>>>>
>>>>> These changes have been tested and confirmed working (with the USB_ET=
H
>>>>> gadget and telnet/ssh in a ramdisk) on a device from the hubble famil=
y
>>>>> (x1s) and also a device from the canvas family (c1s).
>>>>
>>>> I am missing the dt patch, can you pls report the whole series if you
>>>> would like me to review and apply this
>>>
>>> Hi Vinod,
>>>
>>> I've sent the DT series a while back (before resending). Usually I
>>> propose DT changes through Krzysztof's tree. The patches are=20
>>> unchanged (they will be resent unchanged when all usb and wdt=20
>>> changes are merged).
>>=20
>> It makes sense to post bindings and driver togther and mostly these go
>> thru subsystem trees!
>>=20
> I don't think you both speak about the same thing. DT is ambiguous here,
> so always use DTS or DT bindings... that said bindings were here in this
> patchset so if Vinod misses them, this has to be resent.
>
> Best regards,
> Krzysztof

Hi Krzysztof, Vinod.

Krzysztof: Thank you for the clarification. I assumed somehow the
devicetree changes were necessary for the revies. Bad judgment on my part.
Sorry.

Vinod: Sorry for the misunderstanding. I'll resend the patchset shortly.

Regards,
Igor
