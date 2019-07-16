From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH v2 2/4] devfreq: exynos-bus: convert to use
 dev_pm_opp_set_rate()
Date: Tue, 16 Jul 2019 13:56:28 +0200
Message-ID: <e5570b67-8326-c9ba-fb1a-488cb5673410@samsung.com>
References: <20190715120416.3561-1-k.konieczny@partner.samsung.com>
 <CGME20190715120431eucas1p215eae81d0ca772d7e2a22a803669068a@eucas1p2.samsung.com>
 <20190715120416.3561-3-k.konieczny@partner.samsung.com>
 <7f7cf551-005a-c647-d571-77eb5426478a@samsung.com>
 <3d1687b7-4825-ad82-2706-a712c30e530b@samsung.com>
 <5612547b-47c8-0dc4-cb3c-e972782d5a26@samsung.com>
 <3ba736fa-832c-a72c-e60b-f4328e54c524@samsung.com>
 <29cfafc4-ee22-6d38-4c67-776c48bfed8a@samsung.com>
 <1a9e5752-bc2b-3b08-a36b-fc02ca51764c@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1a9e5752-bc2b-3b08-a36b-fc02ca51764c@samsung.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Chanwoo Choi <cw00.choi@samsung.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Nishanth Menon <nm@ti.com>, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, Viresh Kumar <vireshk@kernel.org>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh+dt@kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>, MyungJoo Ham <myungjoo.ham@samsung.com>, Kamil Konieczny <k.konieczny@partner.samsung.com>, linux-arm-kernel@lists.infradead.org, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org


On 7/16/19 1:39 PM, Bartlomiej Zolnierkiewicz wrote:
> 
> On 7/16/19 1:26 PM, Chanwoo Choi wrote:

[...]

>>> Doesn't seem to be needed, care to explain it more?
>>
>> In order to fix the sequence problem between clock and regulator
>> with dev_pm_opp_set_regualtor() and want to keep two functions
>> (exynos_bus_parent_parse_of() and exynos_bus_parse_of()),
>> have to change the call order as following and then modify
>> the exception handling code when error happen.
>>
>> 	node = of_parse_phandle(dev->of_node, "devfreq", 0);                    
>> 	if (node) {                                                             
>> 		of_node_put(node);                                              
>> 		passive = true
>> 	}
>>
>> 	if (!passive)	
>> 		exynos_bus_parent_parse_of()
>> 			dev_pm_opp_set_regulator
>>
>> 	exynos_bus_parse_of()
> 
> OK. This seems like a solution.

PS Thanks for explaining this in detail.

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics
