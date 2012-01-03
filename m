From: Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: Exynos: Hook up power domains to generic power
 domain infrastructure
Date: Tue, 3 Jan 2012 13:53:28 +0530
Message-ID: <CAJuYYwSGYnyq+hEbgpyvFoAB9LWWLhD2URaWsCC4vMyZwRQVbg@mail.gmail.com>
References: <1323704789-23923-1-git-send-email-thomas.abraham@linaro.org>
 <1323704789-23923-2-git-send-email-thomas.abraham@linaro.org>
 <1323704789-23923-3-git-send-email-thomas.abraham@linaro.org>
 <4EFB66C3.4040504@gmail.com>
 <CAJuYYwQbTJTRdsa9WpQuCtSTYacbrcP3CVBFaAYHP1jLPky10A@mail.gmail.com>
 <4F022D7D.3060802@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4F022D7D.3060802-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Sylwester Nawrocki <snjw23-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, rjw-KKrjLPT3xs0@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi Sylwester,

On 3 January 2012 03:49, Sylwester Nawrocki <snjw23-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hi Thomas,
>
> thank you for clarifying.
>
> On 01/02/2012 03:14 AM, Thomas Abraham wrote:
>>
>> The following is a snippet from the dts file used for testing.
>>
>> =A0 =A0[...]
>>
>> =A0 =A0lcd0:power-domain-lcd0 {
>> =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "samsung,exynos4210-pd";
>> =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0x10023C00 0x10>;
>> =A0 =A0};
>>
>> =A0 =A0[...]
>>
>> =A0 =A0fimd0:display-controller {
>> =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "samsung,exynos4-fimd";
>> =A0 =A0 =A0 =A0 =A0 =A0 [...]
>> =A0 =A0 =A0 =A0 =A0 =A0 pd =3D <&lcd0>;
>> =A0 =A0};
>>
>> The fimd (display controller) driver would then do the following.
>>
>> parp =3D of_get_property(pdev->dev.of_node, "pd", NULL);
>> pd_np =3D of_find_node_by_phandle(be32_to_cpup(parp));
>> pm_genpd_of_add_device(pd_np, &pdev->dev);
>
> Sounds interesting. Currently it's platform code that adds devices to
> a corresponding power domain. But doing it at drivers might be more
> convenient for avoiding device/driver/power domain registration
> synchronization issues, especially that knowledge about power domain
> existence may be contained directly in DT description, not needing
> drivers to carry platform specific data.
>
> BTW, I have a feeling that "samsung" is a bit longish prefix for the bind=
ings.
> Didn't you initially consider "sec" for instance ? Probably it is already
> too late for changing that though.

I had not thought of "sec". I agree that "sec" would have been better
as it is shorter and represents bindings specific to Samsung
Electronics. But it is not intuitive at the same time. If there is
greater consensus on using "sec", we could try and request for a
change but looks difficult to get through.

Thanks,
Thomas.

>
>> The lookup is based on the node pointer of the power domain.
>
> Thanks,
> Sylwester
