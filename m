From: Lukasz Luba <l.luba@partner.samsung.com>
Subject: Re: [PATCH v1 21/50] ARM: dts: exynos: add OPP into FSYS APB bus in
 Exynos5420
Date: Mon, 22 Jul 2019 12:47:00 +0200
Message-ID: <7b662b86-f442-3de8-e357-88bf9eaffd5a@partner.samsung.com>
References: <CGME20190715124451eucas1p2904b49f59cca0cbbc22381f168affbb5@eucas1p2.samsung.com>
        <20190715124417.4787-1-l.luba@partner.samsung.com>
        <20190715124417.4787-22-l.luba@partner.samsung.com>
        <CAJKOXPd0kzwZ9_eCK9r04Qj0Rf5SSSnMmwDj11cZozmu0gqsgw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAJKOXPd0kzwZ9_eCK9r04Qj0Rf5SSSnMmwDj11cZozmu0gqsgw@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, linux-clk@vger.kernel.org, mturquette@baylibre.com, sboyd@kernel.org, =?UTF-8?Q?Bart=c5=82omiej_=c5=bbo=c5=82nierkiewicz?= <b.zolnierkie@samsung.com>, kgene@kernel.org, mark.rutland@arm.com, robh+dt@kernel.org, Chanwoo Choi <cw00.choi@samsung.com>, kyungmin.park@samsung.com, Andrzej Hajda <a.hajda@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, s.nawrocki@samsung.com, myungjoo.ham@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

Hi Krzysztof,

On 7/17/19 10:48 AM, Krzysztof Kozlowski wrote:
> On Mon, 15 Jul 2019 at 14:44, Lukasz Luba <l.luba@partner.samsung.com> wrote:
>>
>> Add an OPP for FSYS APB which reflects the real possible frequency.
>> The bus will have a new parent clock which speed has 600MHz, thus
>> a new possible frequency provided by the clock divider is 150MHz.
>> According to the documentation max possible frequency for this bus is
>> 200MHz.
> 
> Commit msg is good but title could be improved. Focus in the title
> what problem/issue you are solving - add intermediate step in scaling
> of FSYS APB?
The devfreq governor for this bus device follows the set OPP of the
master device - WCORE bus and sets the OPP with corresponding ID.
Thus, jumping to max frequency 200MHz when the WCORE bus and other
devices are operating in the middle of their min-max speed is not
needed for FSYS APB and this patch adds the intermediate speed step.

Regards,
Lukasz

> 
> Best regards,
> Krzysztof
> 
> 
