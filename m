From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH] ARM: dts: exynos: Add proper regulator states for
 suspend-to-mem for odroid-u3
Date: Thu, 6 Dec 2018 09:25:39 +0100
Message-ID: <ee0d71cd-a3e0-fbb0-3af8-0ecca1d53ec0@samsung.com>
References: <20181204194025.2719-1-linux.amoon@gmail.com>
        <CAJKOXPcT-x0JWVw2CaxHzSthxbp3sDRcsa4Nc5gHYqUy98b_yw@mail.gmail.com>
        <CGME20181205161223epcas2p24aca718c0d68056140f8430ee8219356@epcas2p2.samsung.com>
        <CANAwSgSSOmTbqS4WUYZHXdB8XL5fjoiGbrh3unxufQ0gZXBPkQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CANAwSgSSOmTbqS4WUYZHXdB8XL5fjoiGbrh3unxufQ0gZXBPkQ@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Anand Moon <linux.amoon@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc@vger.kernel.org, Linux Kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kukjin Kim <kgene@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi All,

On 2018-12-05 17:11, Anand Moon wrote:
> Hi Krzysztof,
>
> Thanks for your review.
> .
> On Wed, 5 Dec 2018 at 19:36, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>> On Tue, 4 Dec 2018 at 20:40, Anand Moon <linux.amoon@gmail.com> wrote:
>>> Add suspend-to-mem node to regulator core to be enabled or disabled
>>> during system suspend and also support changing the regulator operating
>>> mode during runtime and when the system enter sleep mode.
>>>
>>> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
>>> ---
>>> Tested on Odroid U3+


>>> ...


> Well I have tested this patch as following
> with only one issue, before enable suspend number of On-line cpu is 4
> after resume number of On-line cpu is 1.

This seems to be a regression in v4.20-rc1, not related to dts changes
at all. I'm investigating this now...

> ...

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland
