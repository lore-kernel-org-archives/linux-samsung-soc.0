From: Padma Venkat <padma.kvr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V2 2/3] ARM: dts: add Exynos audio subsystem clock
 controller node
Date: Tue, 7 May 2013 16:44:03 +0530
Message-ID: <CAAgF-BdJK9oEVj2fBHTCN5VoGa7eZceW4w=yMMrjnDSdy=P0rA@mail.gmail.com>
References: <1367909016-19657-1-git-send-email-padma.v@samsung.com>
 <1367909016-19657-3-git-send-email-padma.v@samsung.com>
 <2829319.bZPJnVErnQ@amdc1227>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <2829319.bZPJnVErnQ@amdc1227>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: linux-samsung-soc <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Padmavathi Venna <padma.v-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Sangbeom Kim <sbkim73-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Tomasz,

On Tue, May 7, 2013 at 3:24 PM, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
> Hi Padmavathi,
>
> On Tuesday 07 of May 2013 12:13:35 Padmavathi Venna wrote:
>> Audio subsystem introduced in s5pv210 and exynos platforms
>> which has a internal clock controller. This patch adds a node
>> for the same on exynos5250.
>>
>> Signed-off-by: Padmavathi Venna <padma.v-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> ---
>>  arch/arm/boot/dts/exynos5250.dtsi |    6 ++++++
>>  1 files changed, 6 insertions(+), 0 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/exynos5250.dtsi
>> b/arch/arm/boot/dts/exynos5250.dtsi index 36c9d8d..7026de0 100644
>> --- a/arch/arm/boot/dts/exynos5250.dtsi
>> +++ b/arch/arm/boot/dts/exynos5250.dtsi
>> @@ -72,6 +72,12 @@
>>               #clock-cells = <1>;
>>       };
>>
>> +     clock_audss: audss-clock-controller@0x03810000 {
>
> Just a nitpick: this should be @3810000, without the 0x and leading zeroes.

Okey. I will change this.

>
> Best regards,
> --
> Tomasz Figa
> Samsung Poland R&D Center
> SW Solution Development, Kernel and System Framework
>
>> +             compatible = "samsung,exynos5250-audss-clock";
>> +             reg = <0x03810000 0x0C>;
>> +             #clock-cells = <1>;
>> +     };
>> +
>>       gic:interrupt-controller@10481000 {
>>               compatible = "arm,cortex-a15-gic", "arm,cortex-a9-gic";
>>               #interrupt-cells = <3>;
>
Thanks
Padma
