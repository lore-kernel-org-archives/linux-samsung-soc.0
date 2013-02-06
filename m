From: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v3 1/3] drm/exynos: Get HDMI version from device tree
Date: Tue, 5 Feb 2013 16:37:42 -0800
Message-ID: <CAOw6vb+W3phFDJXp3gCx7y0N7mF4o2DpEfTGuNT1pGdKqiCGTg@mail.gmail.com>
References: <1360107777-17490-1-git-send-email-seanpaul@chromium.org>
 <1360107777-17490-2-git-send-email-seanpaul@chromium.org>
 <5111A23F.50300@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <5111A23F.50300-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
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
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Tomasz Stanislawski <t.stanislaws-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "kgene.kim" <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, InKi Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sylwester Nawrocki <sylvester.nawrocki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Olof Johansson <olofj-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, RAHUL SHARMA <rahul.sharma-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, Feb 5, 2013 at 4:22 PM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
> n 02/05/2013 04:42 PM, Sean Paul wrote:
>> Use the compatible string in the device tree to determine which
>> registers/functions to use in the HDMI driver. Also changes the
>> references from v13 to 4210 and v14 to 4212 to reflect the IP
>> block version instead of the HDMI version.
>
>> diff --git a/Documentation/devicetree/bindings/drm/exynos/hdmi.txt b/Documentation/devicetree/bindings/drm/exynos/hdmi.txt
>
> Binding looks sane to me.
>
>> diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
>
>>  #ifdef CONFIG_OF
>>  static struct of_device_id hdmi_match_types[] = {
>>       {
>> -             .compatible = "samsung,exynos5-hdmi",
>> -             .data   = (void *)HDMI_TYPE14,
>> +             .compatible = "samsung,exynos4-hdmi",
>>       }, {
>>               /* end node */
>>       }
>
> Why not fill in all the "base" compatible values there (I think you need
> this anyway so that DTs don't all have to be compatible with
> samsung,exynos4-hdmi), with .data containing the HDMI_VER_EXYNOS*
> values, then ...
>

At the moment, all DTs have to be compatible with exynos4-hdmi since
it provides the base for the current driver. The driver uses 4210 and
4212 to differentiate between different register addresses and
features, but most things are just exynos4-hdmi compatible.

>> @@ -2218,17 +2217,18 @@ static int hdmi_probe(struct platform_device *pdev)
>
>> +
>> +     if (of_device_is_compatible(dev->of_node, "samsung,exynos4210-hdmi"))
>> +             hdata->version |= HDMI_VER_EXYNOS4210;
>> +     if (of_device_is_compatible(dev->of_node, "samsung,exynos4212-hdmi"))
>> +             hdata->version |= HDMI_VER_EXYNOS4212;
>> +     if (of_device_is_compatible(dev->of_node, "samsung,exynos5250-hdmi"))
>> +             hdata->version |= HDMI_VER_EXYNOS5250;
>
> Instead of that, do roughly:
>
>     match = of_match_device(hdmi_match_types, &pdev->dev);
>     if (match)
>         hdata->version |= (int)match->data;
>
> That way, it's all table-based. Any future additions to
> hdmi_match_types[] won't require another if statement to be added to
> probe().

I don't think it's that easy. of_match_device returns the first match
from the device table, so I'd still need to iterate through the
matches. I could still break this out into a table, but I don't think
of_match_device is the right way to probe it.

Sean
