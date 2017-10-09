From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH 0/4] Fix problems with Exynos4412 ISP clocks
Date: Mon, 09 Oct 2017 12:58:18 +0200
Message-ID: <76fcaecf-7c38-a1a6-b4b1-47e6966f8b34@samsung.com>
References: <CGME20171002104824eucas1p1f9795b5403b6cd599b1e33e9dc7b604f@eucas1p1.samsung.com>
        <20171002104759.25944-1-m.szyprowski@samsung.com>
        <cdea0207-adea-d9e3-f95a-64188bd4bcca@samsung.com>
        <CAJKOXPd5_tV_VenxOL-H_z+ej0QR7X8F3DBZ=Mneu_9pe+h4QQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-reply-to: <CAJKOXPd5_tV_VenxOL-H_z+ej0QR7X8F3DBZ=Mneu_9pe+h4QQ@mail.gmail.com>
Content-language: en-GB
Sender: linux-clk-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>, Inki Dae <inki.dae@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On 10/09/2017 12:49 PM, Krzysztof Kozlowski wrote:
> On Mon, Oct 9, 2017 at 12:34 PM, Sylwester Nawrocki
> <s.nawrocki@samsung.com> wrote:
>> On 10/02/2017 12:47 PM, Marek Szyprowski wrote:
>>> Patch summary:
>>>
>>> Marek Szyprowski (4):
>>>   clk: samsung: Instantiate Exynos4412 ISP clocks only when available
>>>   clk: samsung: Add a separate driver for Exynos4412 ISP clocks
>>>   ARM: dts: exynos: Add Exynos4412 ISP clock controller
>>>   clk: samsung: Remove obsolete code for Exynos4412 ISP clocks

>> I have applied whole series, with v2 of patch 2/4, thanks.
> You mean you applied 1/4 and 2/4 for now, right? 3/4 will go through
> my tree in release after this and 4/4 even later?

Ah yes, sorry, just noticed that. Indeed I've taken only first two 
patches, the third is for dts and the last one will be applied after 
some time as you say.

-- 
Regards,
Sylwester
