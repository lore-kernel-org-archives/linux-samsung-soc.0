From: Tushar Behera <tushar.behera-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/2] clk: exynos4: Add alias for cpufreq related clocks
Date: Mon, 17 Jun 2013 10:20:45 +0530
Message-ID: <51BE95A5.5090509@linaro.org>
References: <1370517749-29892-1-git-send-email-tushar.behera@linaro.org>
 <2070978.AjQD2isvSl@flatron> <51B54B4F.3000503@linaro.org>
 <3226068.I7g6oVyl1p@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <3226068.I7g6oVyl1p@flatron>
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
To: Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: l.majewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On 06/11/2013 12:23 AM, Tomasz Figa wrote:
> On Monday 10 of June 2013 09:13:11 Tushar Behera wrote:
>> On 06/08/2013 05:20 PM, Tomasz Figa wrote:
>>> On Thursday 06 of June 2013 16:52:28 Tushar Behera wrote:

[ ... ]

>>>>  	MUX_A(mout_core, "mout_core", mout_core_p4210,
>>>>
>>>> -			SRC_CPU, 16, 1, "mout_core"),
>>>> +			SRC_CPU, 16, 1, "moutcore"),
>>>
>>> IMHO those typo corrections are not part of this patch.
>>
>> But the older drivers (before migration to CCF) were using the clock
>> "moutcore" (not "mout_core").
> 
> I mean, this should be placed in a separate patch, as this change is not 
> "adding alias for cpufreq related clocks", but rather fixing a typo.
> 

Is it ok if I split this patch into 2, one adding clock alias
'mout_apll' and another one fixing the alias names 'mout_mpll',
'moutcore' and 'armclk'?

[ ... ]

>>> Basically I don't like the idea of those global aliases, which IMHO
>>> should be completely dropped. Someone might not like it, but I'd go
>>> with the conversion of our cpufreq drivers to platform drivers
>>> instead, which could receive things like clocks and regulators using
>>> DT-based lookups.
>> I agree. Migration of exynos-cpufreq driver as a platform driver is the
>> best solution. But unless someone picks up that work, cpufreq support
>> for EXYNOS4 based systems is broken because of the incorrect clock
>> aliases.
> 
> We have patches for this in our internal tree. I will clean them up a bit 
> and submit soon.
> 

If you are going to submit the cpufreq driver patches for v3.11, then we
can ignore this patchset. Otherwise, I would prefer to get these patches
merged for v3.11 to get cpufreq working. Once the driver changes are
incorporated, we can very well modify these later.

Thanks.
-- 
Tushar Behera
