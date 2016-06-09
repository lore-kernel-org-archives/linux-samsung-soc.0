From: Roger Quadros <rogerq@ti.com>
Subject: Re: [RFC v4 2/7] Revert "extcon: usb-gpio: switch to use pm wakeirq
 apis"
Date: Thu, 9 Jun 2016 11:20:29 +0300
Message-ID: <575926CD.80608@ti.com>
References: <1465393686-16644-1-git-send-email-k.kozlowski@samsung.com>
 <1465393686-16644-3-git-send-email-k.kozlowski@samsung.com>
 <57592220.9030201@ti.com> <5759247E.6060901@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <5759247E.6060901@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kukjin Kim <kgene@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Felipe Balbi <balbi@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Peter Chen <peter.chen@freescale.com>, "Ivan T. Ivanov" <iivanov@mm-sol.com>, kishon@ti.com
List-Id: linux-samsung-soc@vger.kernel.org

On 09/06/16 11:10, Krzysztof Kozlowski wrote:
> On 06/09/2016 10:00 AM, Roger Quadros wrote:
>> -balbi@ti
>> +balbi@kernel
>>
>> Hi,
>>
>> On 08/06/16 16:48, Krzysztof Kozlowski wrote:
>>> This reverts commit 8106e404174253639731cc30a44f5b3ab764c5b7.
>>
>> The above commit id is not present in v4.7-rc1 and this patch doesn't apply properly.
>> Can you please rebase this series on v4.7-rc1?
> 
> The commit is present in extcon tree for v4.8. The extcon patches will
> be applied (probably) to that tree so what is the point of rebasing on
> v4.7-rc1?

OK, please ignore my comment. Would be nice if you mention in the cover letter
which tree the series is based on.

> 
> Also the point of this particular patch is to show that previous change
> should be just dropped. Don't replace things to complicated devm-like
> functions just to simplify one path in the driver...
> 

--
cheers,
0roger
