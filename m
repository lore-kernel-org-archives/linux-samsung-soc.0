From: Kamil Konieczny <k.konieczny@partner.samsung.com>
Subject: Re: [PATCH v5 1/5] clk: samsung: exynos5433: fix typo in imem
 divider
Date: Fri, 25 Jan 2019 13:41:00 +0100
Message-ID: <9725eefc-2f2b-5fe1-326f-59f377999e17@partner.samsung.com>
References: <20190122090232.29194-1-k.konieczny@partner.samsung.com>
        <CGME20190122090249eucas1p161cfc1364fb8ee76d2d04383935e8f3b@eucas1p1.samsung.com>
        <20190122090232.29194-2-k.konieczny@partner.samsung.com>
        <20190122093313.GA21774@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20190122093313.GA21774@kroah.com>
Content-Language: en-US
Sender: stable-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>, devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, stable@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On 22.01.2019 10:33, Greg KH wrote:
> On Tue, Jan 22, 2019 at 10:02:28AM +0100, Kamil Konieczny wrote:
>> Fix typo in imem clock divider 200 switched with 266.
>>
>> Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>
>> Signed-off-by: Kamil Konieczny <k.konieczny@partner.samsung.com>
>> ---
>>  drivers/clk/samsung/clk-exynos5433.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> <formletter>
> 
> This is not the correct way to submit patches for inclusion in the
> stable kernel tree.  Please read: [...]
After reconsideration that there are no users of imem clock in old kernels,
please drop this patch from stable.

-- 
Best regards,
Kamil Konieczny
Samsung R&D Institute Poland
