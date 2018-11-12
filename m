From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH 0/4] Fix common issue in MAX* extcon drivers
Date: Mon, 12 Nov 2018 09:18:01 +0900
Message-ID: <5BE8C6B9.1090609@samsung.com>
References: <CGME20181108134553eucas1p1a513f538b74fab263c3f143914d30720@eucas1p1.samsung.com>
        <20181108134548.31140-1-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20181108134548.31140-1-m.szyprowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Marek,

On 2018년 11월 08일 22:45, Marek Szyprowski wrote:
> Hi All
> 
> Most MAX* MUIC drivers unconditionally force UART path during probe.
> This approach causes some issues, especially when board is booted with
> non-UART cable connected to micro-USB port. For example, when USB cable is
> connected, UART TX/RX lines are unconditionally short-circuited to USB
> D+/D- lines. This is in turn recognized by a series of serial BREAK
> signals and some random characters when USB host tries to perform
> enumeration procedure.
> 
> To solve the above issue and keep UART console operational as early as
> possible, set UART path only when USB ID reports UART capable cable.
> 
> This patchset fixes following MAX* extcon drivers: 8997, 14577, 77693
> and 77843.
> 
> Tested on following Samsung boards: Trats (8997), Rinato (14577), Trats2
> (77693) and TM2/TM2e (77843).
> 
> Best regards
> Marek Szyprowski
> Samsung R&D Institute Poland
> 
> 
> Patch summary:
> 
> Marek Szyprowski (4):
>   extcon: max77843: Avoid forcing UART path on drive probe
>   extcon: max77693: Avoid forcing UART path on drive probe
>   extcon: max14577: Avoid forcing UART path on drive probe
>   extcon: max8997: Avoid forcing UART path on drive probe
> 
>  drivers/extcon/extcon-max14577.c | 15 +++++++++++++--
>  drivers/extcon/extcon-max77693.c | 16 ++++++++++++++--
>  drivers/extcon/extcon-max77843.c | 18 +++++++++++++++---
>  drivers/extcon/extcon-max8997.c  | 15 +++++++++++++--
>  4 files changed, 55 insertions(+), 9 deletions(-)
> 

Applied them. Thanks.

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
