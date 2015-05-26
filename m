From: Beata Michalska <b.michalska@samsung.com>
Subject: Re: [PATCH] ARM: dts: Update video-phy node with syscon phandle for
 Exynos3250
Date: Tue, 26 May 2015 10:50:30 +0200
Message-ID: <556433D6.8070307@samsung.com>
References: <1426762587-24923-1-git-send-email-b.michalska@samsung.com>
 <CAJKOXPfumy5a6A275ETy7vnztzE20qSuXD_i=ebY9Br47p93Dg@mail.gmail.com>
 <CAJKOXPcnYq0pS-akXNDd8TE6wqeq0pg-cx4PK0jeke9z3tHsOw@mail.gmail.com>
 <CABxcv=npaHemH_KcYgGf-_x8Bo=V2UMDJREfUY6LRmDT1iQYpw@mail.gmail.com>
 <555FF9AC.1060909@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <555FF9AC.1060909@kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Kukjin Kim <kgene@kernel.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Javier Martinez Canillas <javier@dowhile0.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

On 05/23/2015 05:53 AM, Kukjin Kim wrote:
> On 05/21/15 16:25, Javier Martinez Canillas wrote:
>> On Thu, May 21, 2015 at 4:04 AM, Krzysztof Kozlowski
>> <k.kozlowski@samsung.com> wrote:
>>> 2015-05-21 10:57 GMT+09:00 Krzysztof Kozlowski <k.kozlowski@samsung.com>:
>>>> 2015-03-19 19:56 GMT+09:00 Beata Michalska <b.michalska@samsung.com>:
>>>>> As a follow-up to recent changes to Exynos mipi video phy
>>>>> driver, introducing support for PMU regmap in commit
>>>>> e4b3d38088df6f3acd40 ("phy: exynos-video-mipi: Fix regression
>>>>> by adding support for PMU regmap") add a syscon phandle to
>>>>> video-phy node to bring back to life both MIPI DSI displays
>>>>> and MIPI CSIS-2 camera sensors on Exynos3250.
>>>>>
>>>>> Signed-off-by: Beata Michalska <b.michalska@samsung.com>
>>>>
>>>> Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
>>>> Tested-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
>>>>
>>>> Tested on Gear 2 (Exynos3250) board.
>>>
>>> Oh, I was too fast. It seems that "reg" property is not needed
>>> anymore. Can you remove it?
>>>
>>
>> After removing the reg property as Krzysztof suggested.
>>
>> Reviewed-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
>>
> will apply with changing as per you guys' review comment ;-)
> 
> Thanks,
> Kukjin
> 

Apologies for not jumping in earlier, but  I've been away for a while,
with basically no e-mail access. Would You like me to resend the patch 
with the 'reg' property removed or will You handle it while applying
the change ?

Best Regards
Beata
