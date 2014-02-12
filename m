From: Kumar Gala <galak@codeaurora.org>
Subject: Re: [PATCH 2/3] arm64: Add Kconfig option for Samsung GH7 SoC family
Date: Wed, 12 Feb 2014 10:25:59 -0600
Message-ID: <B1132DDA-ECB1-4971-98AE-6DDDDD985CFB@codeaurora.org>
References: <1392100183-30930-1-git-send-email-kgene.kim@samsung.com> <1392100183-30930-3-git-send-email-kgene.kim@samsung.com> <CAOesGMiWsWXkQkb-_VZGco0gKNZPsHf3ubR88y4Pt4-umk5_Ww@mail.gmail.com> <20140212103824.GF29702@arm.com>
Mime-Version: 1.0 (Mac OS X Mail 7.1 \(1827\))
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.11.231]:60071 "EHLO
	smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753175AbaBLQ0J convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 12 Feb 2014 11:26:09 -0500
In-Reply-To: <20140212103824.GF29702@arm.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Olof Johansson <olof@lixom.net>, Thomas Abraham <thomas.ab@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Ilho Lee <ilho215.lee@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>


On Feb 12, 2014, at 4:38 AM, Catalin Marinas <catalin.marinas@arm.com> wrote:

> On Tue, Feb 11, 2014 at 11:39:27PM +0000, Olof Johansson wrote:
>> On Mon, Feb 10, 2014 at 10:29 PM, Kukjin Kim <kgene.kim@samsung.com> wrote:
>>> This patch adds support for Samsung GH7 SoC in arm64/Kconfig.
>>> 
>>> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
>>> Cc: Catalin Marinas <catalin.marinas@arm.com>
>> 
>> The overhead of building one more device tree isn't very large, and I
>> don't see any other need to have a Kconfig entry per SoC at this time.
>> It's of course up to Catalin, but you might just want to always
>> compile all dts files instead.
> 
> For arm64, I thought of getting rid of ARCH_* Kconfig entries entirely,
> only that I haven't heard any strong opinion either way (in which case
> I'll do it, with a risk of single Image getting bigger and bigger and
> people needing smaller Image can trim their .config).

One reason to keep around ARCH_* is for drivers shared between arm and arm64 that depend on it.

- k

-- 
Employee of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
