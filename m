From: Kukjin Kim <kgene@kernel.org>
Subject: Re: [PATCH RESEND 0/4] Small updates to Snow and Peach Pit/Pi DTS
Date: Thu, 15 Jan 2015 00:28:23 +0900
Message-ID: <54B68B17.1070604@kernel.org>
References: <1420212257-22443-1-git-send-email-javier.martinez@collabora.co.uk> <54B3A4C2.8070304@collabora.co.uk> <54B68773.10805@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:45787 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752777AbbANP23 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 Jan 2015 10:28:29 -0500
In-Reply-To: <54B68773.10805@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>
Cc: Javier Martinez Canillas <javier.martinez@collabora.co.uk>, linux-samsung-soc@vger.kernel.org, Kevin Hilman <khilman@linaro.org>, Doug Anderson <dianders@chromium.org>, linux-kernel@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org

On 01/15/15 00:12, Kukjin Kim wrote:
> On 01/12/15 19:41, Javier Martinez Canillas wrote:
>> Hello Kukjin,
>>
> Hi,
> 
>> On 01/02/2015 04:24 PM, Javier Martinez Canillas wrote:
>>>
>>> This series adds some DTS snippets that were missing in the mainline
>>> Snow and Peach Pit/Pi Device Trees but are present in the downstream
>>> ChromeOS kernel.
>>>
>>> The series is composed of the following patches:
>>>
>>> Javier Martinez Canillas (4):
>>>   ARM: dts: Add power and lid GPIO keys pinctrl for exynos5250-snow
>>>   ARM: dts: Add lid GPIO key device node for Peach boards
>>>   ARM: dts: Set Peach boards USB WebCam regulators to always on
>>>   ARM: dts: Configure regulators for suspend on exynos Peach boards
>>>
>>>  arch/arm/boot/dts/exynos5250-snow.dts      |  16 +++++
>>>  arch/arm/boot/dts/exynos5420-peach-pit.dts | 100 +++++++++++++++++++++++++++-
>>>  arch/arm/boot/dts/exynos5800-peach-pi.dts  | 101 ++++++++++++++++++++++++++++-
>>>  3 files changed, 215 insertions(+), 2 deletions(-)
>>>
>>> Patch #1 adds some pinctrl lines for the GPIO keys in the Snow DTS.
>>>
>>> Patch #2 adds a device node and pinctrl lines for the lid GPIO in
>>> the Peach boards DTS.
>>>
>>> Patch #3 sets the regulators that supply voltage to the USB WebCam
>>> in Peach boards as always on.
>>>
>>> Patch #4 configures the max77802 regulators on the Peach Pit and Pi
>>> boards to be enabled or disabled during system suspend.
>>>
>>
>> I saw that you collected some DTS patches for 3.20 but these are not
>> included. Any comments about this series?
>>
> Yeah, but I don't think I checked all of submitted patches including
> this at that time and I'll have a look at this series soon.
> 
> Thanks for your gentle reminder.
> 
This series looks good to me, applied ;-)

Thanks,
Kukjin
