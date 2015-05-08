From: Kukjin Kim <kgene@kernel.org>
Subject: Re: [PATCH 1/1] ARM: dts: Add keep-power-in-suspend to WiFi SDIO
 nodefor Snow
Date: Sat, 09 May 2015 03:14:04 +0900
Message-ID: <554CFCEC.5070803@kernel.org>
References: <1430929979-18119-1-git-send-email-javier.martinez@collabora.co.uk>	<CAD=FV=XJXHjXxirjwPfrJ3=xOj46GTqdSxxFstzjTVJ9HP1Q=w@mail.gmail.com> <CAJKOXPc88v_VzqE54sup4JHAgqwYCn0g_zpKgJwpny3egaZAbw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAJKOXPc88v_VzqE54sup4JHAgqwYCn0g_zpKgJwpny3egaZAbw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Doug Anderson <dianders@chromium.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Kukjin Kim <kgene@kernel.org>, Olof Johansson <olof@lixom.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-samsung-soc@vger.kernel.org

On 05/08/15 09:09, Krzysztof Kozlowski wrote:
> 2015-05-07 1:36 GMT+09:00 Doug Anderson <dianders@chromium.org>:
>> Javier,
>>
>> On Wed, May 6, 2015 at 9:32 AM, Javier Martinez Canillas
>> <javier.martinez@collabora.co.uk> wrote:
>>> The Marvell mwifiex driver prevents the system to enter into a suspend
>>> state if the card power is not preserved during a suspend/resume cycle.
>>>
>>> So Suspend-to-RAM and Suspend-to-idle are failing on Exynos5250 Snow.
>>>
>>> Add the keep-power-in-suspend Power Management property to the SDIO/MMC
>>> node so the mwifiex suspend handler doesn't fail and the system is able
>>> to enter into a suspend state.
>>>
>>> Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
>>> ---
>>>
>>> Kukjin and Krzysztof,
>>>
>>> I didn't notice that Snow was also missing this property when I did the
>>> same change for Peach Pit and and Pi Chromebooks [0], sorry about that.
>>>
No problem and thanks for your effort.

>>> Best regards,
>>> Javier
>>>
>>> [0]: https://lkml.org/lkml/2015/4/7/377
>>> ---
>>>  arch/arm/boot/dts/exynos5250-snow.dts | 1 +
>>>  1 file changed, 1 insertion(+)
>>
>> Reviewed-by: Doug Anderson <dianders@chromium.org>
> 
Doug, thanks for your review.

> Thanks, applied to dts-fixes branch, I'll try to push it sooner than
> later but it depends on status of previous pull requests.
> 
Krzysztof, I've applied this into my tree directly.
Thanks for your gentle reminder and time.

- Kukjin
