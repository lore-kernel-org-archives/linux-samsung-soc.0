From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [RFC PATCH 12/14] ARM: dts: exynos5: add system register support
Date: Tue, 15 Apr 2014 11:18:58 +0200
Message-ID: <534CF982.4020102@samsung.com>
References: <1397540862-21359-1-git-send-email-yj44.cho@samsung.com>
 <1397540862-21359-13-git-send-email-yj44.cho@samsung.com>
 <CAK9yfHz9yFjQ8x2UuR7uvPTR+E8wUo4W+2XYKiF17RmwMji8OQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <CAK9yfHz9yFjQ8x2UuR7uvPTR+E8wUo4W+2XYKiF17RmwMji8OQ@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Seung-Woo Kim <sw0312.kim@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Andrzej Hajda <a.hajda@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Kukjin Kim <kgene.kim@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On 15/04/14 10:41, Sachin Kamat wrote:
> On 15 April 2014 11:17, YoungJun Cho <yj44.cho@samsung.com> wrote:
>> This patch adds sysreg device node, and sysreg property to fimd device node
>> which is required to use I80 interface.
>>
>> Signed-off-by: YoungJun Cho <yj44.cho@samsung.com>
>> Signed-off-by: Inki Dae <inki.dae@samsung.com>
>> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
>> ---
>>  arch/arm/boot/dts/exynos5.dtsi |    6 ++++++
>>  1 file changed, 6 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/exynos5.dtsi b/arch/arm/boot/dts/exynos5.dtsi
>> index 258dca4..f938bbb 100644
>> --- a/arch/arm/boot/dts/exynos5.dtsi
>> +++ b/arch/arm/boot/dts/exynos5.dtsi
>> @@ -88,12 +88,18 @@
>>                 status = "disabled";
>>         };
>>
>> +       sys_reg: syscon@10050000 {
>> +               compatible = "samsung,exynos5-sysreg", "syscon";
> 
> Do we really need a separate string for this? Can't we use
> "samsung,exynos4-sysreg" itself?

Currently only "syscon" is meaningful in Linux, and we add second SoC
specific compatible to be able to distinguish between various SoC
revisions, should any SoC specific quirks be handled in future.
Thus there is no much point in adding "samsung,exynos4-sysreg" to
exynos5.dtsi. We could as well only leave "syscon" entry alone.
My suggestion is to keep "samsung,exynos5-sysreg", so for instance
Exynos4 and Exynos5 SOC series SYSREG blocks can be identified in
an OS.

--
Regards,
Sylwester
