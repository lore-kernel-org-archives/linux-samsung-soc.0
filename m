From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 20/22] ARM: dts: exynos: Move common
 Exynos5410/542x/5800 nodes to new DTSI
Date: Tue, 10 May 2016 07:33:06 +0200
Message-ID: <57317292.2080004@kernel.org>
References: <1462734367-5619-1-git-send-email-krzk@kernel.org>
 <1462734367-5619-21-git-send-email-krzk@kernel.org>
 <9e642e0d-87e1-4661-0233-acecf0082f24@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-reply-to: <9e642e0d-87e1-4661-0233-acecf0082f24@osg.samsung.com>
Sender: linux-clk-owner@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On 05/09/2016 11:53 PM, Javier Martinez Canillas wrote:
> Hello Krzysztof,
> 
> On 05/08/2016 03:06 PM, Krzysztof Kozlowski wrote:
>> The Exynos5410/542x/5800 are very similar designs. Create new new
> 
> s/new new/a new
> 
>> DTSI with common nodes to remove DTS duplication. Although currently
>> only MCT and SysRAM are shared but in future more nodes will be added to
>> common file.
>>
>> The patch should not have functional impact.
>>
> 
> A nice way to check this is to diff the disassembled compiled DTBs with
> and without the patch and making sure that the resulted DTS is the same.

Yes, that is what I've done. Recently there is a tool making that even
easier: dtx_diff.

Best regards,
Krzysztof

