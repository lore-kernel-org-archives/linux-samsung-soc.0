From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH v3 2/2] ARM: EXYNOS: Add Gscaler device from DT
Date: Thu, 2 Aug 2012 09:33:02 -0700
Message-ID: <CAOesGMiZMrv4GY=v1WPn_qGZgg=vduO2TbsUOQ6sCah-ZvOg_A@mail.gmail.com>
References: <1342789723-3949-1-git-send-email-shaik.ameer@samsung.com>
 <1342789723-3949-3-git-send-email-shaik.ameer@samsung.com>
 <033301cd6fb0$7ac4af90$704e0eb0$%kim@samsung.com>
 <CAJuYYwTy5zkeM_cJO7HMm+=v=ORPHD26nQYZwXK6v1noWm1EuA@mail.gmail.com>
 <5018E656.3070803@samsung.com>
 <036f01cd6fc4$120a9910$361fcb30$%kim@samsung.com>
 <50197D66.1050108@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <50197D66.1050108-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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
To: Sylwester Nawrocki <sylvester.nawrocki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Shaik Ameer Basha <shaik.ameer-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, sy0816.kang-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, sungchun.kang-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, joshi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, thomas.ab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, shaik.samsung-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, olofj-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Aug 1, 2012 at 12:03 PM, Sylwester Nawrocki
<sylvester.nawrocki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> It wouldn't be clear what specific SoCs the "samsung,exynos5-gsc" compatible
> string applies to, would it ? I believe there are already minor differences
> in GScaler parameters on currently available exynos5 SoC. The variant data
> structures are used to handle this and the compatible string determines which
> variant data structure is selected during driver's initialization.
> If you use a wildcard 'compatible' string this won't be possible any more.
>
> Also it would look odd IMO to have two compatible strings like:
> compatible = "samsung,exynos5-gsc", "samsung,exynos5400-gsc";

In this particular case, since you're saying that there are subtle
differences between different part numbers, I'm guessing there's good
reason to go specific, but in general there's no need to avoid
exynos5-gsc.

Your example is also false, since the strings would be in reverse
order (from specific to generic). That would look perfectly normal.

So, bottom line: I agree in this particular instance, but I disagree
that it's a hard generic rule.


-Olof
