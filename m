From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 1/1] ARM: dts: Add keep-power-in-suspend to WiFi SDIO node
 for Snow
Date: Fri, 8 May 2015 09:09:15 +0900
Message-ID: <CAJKOXPc88v_VzqE54sup4JHAgqwYCn0g_zpKgJwpny3egaZAbw@mail.gmail.com>
References: <1430929979-18119-1-git-send-email-javier.martinez@collabora.co.uk>
	<CAD=FV=XJXHjXxirjwPfrJ3=xOj46GTqdSxxFstzjTVJ9HP1Q=w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vn0-f51.google.com ([209.85.216.51]:36006 "EHLO
	mail-vn0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751255AbbEHAJQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 7 May 2015 20:09:16 -0400
In-Reply-To: <CAD=FV=XJXHjXxirjwPfrJ3=xOj46GTqdSxxFstzjTVJ9HP1Q=w@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Kukjin Kim <kgene@kernel.org>, Olof Johansson <olof@lixom.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

2015-05-07 1:36 GMT+09:00 Doug Anderson <dianders@chromium.org>:
> Javier,
>
> On Wed, May 6, 2015 at 9:32 AM, Javier Martinez Canillas
> <javier.martinez@collabora.co.uk> wrote:
>> The Marvell mwifiex driver prevents the system to enter into a suspend
>> state if the card power is not preserved during a suspend/resume cycle.
>>
>> So Suspend-to-RAM and Suspend-to-idle are failing on Exynos5250 Snow.
>>
>> Add the keep-power-in-suspend Power Management property to the SDIO/MMC
>> node so the mwifiex suspend handler doesn't fail and the system is able
>> to enter into a suspend state.
>>
>> Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
>> ---
>>
>> Kukjin and Krzysztof,
>>
>> I didn't notice that Snow was also missing this property when I did the
>> same change for Peach Pit and and Pi Chromebooks [0], sorry about that.
>>
>> Best regards,
>> Javier
>>
>> [0]: https://lkml.org/lkml/2015/4/7/377
>> ---
>>  arch/arm/boot/dts/exynos5250-snow.dts | 1 +
>>  1 file changed, 1 insertion(+)
>
> Reviewed-by: Doug Anderson <dianders@chromium.org>

Thanks, applied to dts-fixes branch, I'll try to push it sooner than
later but it depends on status of previous pull requests.

Best regards,
Krzysztof
