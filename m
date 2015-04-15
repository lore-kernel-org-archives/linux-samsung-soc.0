From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: [PATCH 1/1] ARM: dts: Add keep-power-in-suspend to WiFi SDIO
 node for Peach Boards
Date: Wed, 15 Apr 2015 10:07:21 +0200
Message-ID: <552E1C39.4070104@collabora.co.uk>
References: <1428411814-21098-1-git-send-email-javier.martinez@collabora.co.uk> <CAD=FV=WhwEFWqZW8ByQrH3N43X7djMve-23ckqUCZ4EevZC7vw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:36006 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751757AbbDOIHi (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 15 Apr 2015 04:07:38 -0400
In-Reply-To: <CAD=FV=WhwEFWqZW8ByQrH3N43X7djMve-23ckqUCZ4EevZC7vw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>
Cc: Doug Anderson <dianders@chromium.org>, Olof Johansson <olof@lixom.net>, Kevin Hilman <khilman@linaro.org>, Tyler Baker <tyler.baker@linaro.org>, Abhilash Kesavan <kesavan.abhilash@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hello Kukjin,

On 04/07/2015 05:09 PM, Doug Anderson wrote:
> Javier,
> 
> On Tue, Apr 7, 2015 at 6:03 AM, Javier Martinez Canillas
> <javier.martinez@collabora.co.uk> wrote:
>> The Marvell mwifiex driver prevents the system to enter into a suspend
>> state if the card power is not preserved during a suspend/resume cycle.
>>
>> So Suspend-to-RAM and Suspend-to-idle is failing on Exynos5800 Peach Pi
>> and Exynos5420 Peach Pit Chromebooks.
>>
>> Add the keep-power-in-suspend Power Management property to the SDIO/MMC
>> node so the mwifiex suspend handler doesn't fail and the system is able
>> to enter into a suspend state.
>>
>> Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
>> ---
>>  arch/arm/boot/dts/exynos5420-peach-pit.dts | 1 +
>>  arch/arm/boot/dts/exynos5800-peach-pi.dts  | 1 +
>>  2 files changed, 2 insertions(+)
> 
> Reviewed-by: Doug Anderson <dianders@chromium.org>
> 

Any comments on this patch?

Best regards,
Javier
