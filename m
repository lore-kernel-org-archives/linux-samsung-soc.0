From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH 1/2] ARM: dts: Enable RTC node in exynos4.dtsi file
Date: Wed, 13 Nov 2013 11:27:03 +0100
Message-ID: <528353F7.4050004@samsung.com>
References: <1382438215-13215-1-git-send-email-sachin.kamat@linaro.org>
 <086401cedf96$933b0450$b9b10cf0$@org>
 <CAK9yfHzj+bA1mbZP3KJsU=XiAm+6GaXryDKphPX=UKaaOkXpNw@mail.gmail.com>
 <1895231.F4mtKgSWc9@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:31828 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756795Ab3KMK1Q (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 13 Nov 2013 05:27:16 -0500
In-reply-to: <1895231.F4mtKgSWc9@flatron>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>, Sachin Kamat <sachin.kamat@linaro.org>
Cc: Kukjin Kim <kgene@kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Stephen Warren <swarren@wwwdotorg.org>

On 13/11/13 09:08, Tomasz Figa wrote:
>> As was discussed earlier too, status field of DT node is not supposed
>> > to be used for
>> > keeping an IP enabled or disabled. That should be done via the kernel
>> > config. The DT status
>> > is mostly to indicate the hardware status of the IP on the SoC/board.
>> > If the node fully defines the hardware,
>> > then it should be kept enabled by default unless such enabling causes
>> > some issues with other IPs due to
>> > pin sharing conflicts, etc. In the above case the node completely
>> > defines the hardware and hence there is no
>> > reason to keep it disabled.
>
> That's correct. (Unless I'm missing some board specific dependency of RTC.
> If so, please correct me.)

I don't really like this argument. Why not allow the firmware to decide
which devices are relevant and should be handled by the kernel ?
And since we are aiming at single kernel config, if I understand things
correctly, I can't see anything else than dts that could hold the machine
*configuration*.

So let's not make all stuff enabled by default, that's not something we
want on those mobile device SoCs. We should not be making fine system
tuning more difficult than necessary.

I'm with Kukjin on this matter and would prefer patches like the $subject
patch not be merged.

--
Thanks,
Sylwester
