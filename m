From: Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 Resend 2/3] of/documentation: Update G2D documentation
Date: Thu, 11 Jul 2013 12:24:13 +0200
Message-ID: <1748068.8mvO9B4JjP@thinkpad>
References: <1373351355-27444-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1373351355-27444-1-git-send-email-sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
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
To: Sachin Kamat <sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi Sachin,

On Tuesday 09 of July 2013 11:59:15 Sachin Kamat wrote:
> Exynos5250 G2D IP requires only the gate clock. Update the
> binding documentation accordingly.
> 
> Signed-off-by: Sachin Kamat <sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Cc: Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---
> Updated the description of clock-names as suggested by Tomasz Figa.
> ---
>  .../devicetree/bindings/gpu/samsung-g2d.txt        |    7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/gpu/samsung-g2d.txt
> b/Documentation/devicetree/bindings/gpu/samsung-g2d.txt index
> 3f454ff..c4f358d 100644
> --- a/Documentation/devicetree/bindings/gpu/samsung-g2d.txt
> +++ b/Documentation/devicetree/bindings/gpu/samsung-g2d.txt
> @@ -11,8 +11,11 @@ Required properties:
> 
>    - interrupts : G2D interrupt number to the CPU.
>    - clocks : from common clock binding: handle to G2D clocks.
> -  - clock-names : from common clock binding: must contain "sclk_fimg2d" and
> -		  "fimg2d", corresponding to entries in the clocks property.
> +  - clock-names : names of clocks listed in clocks property, in the same
> +		  order, depending on SoC type:
> +		  - for S5PV210 and Exynos4 based SoCs: "fimg2d" and
> +		    "sclk_fimg2d"
> +		  - for Exynos5250 SoC: "fimg2d".

This looks fine for me now.

Reviewed-by: Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>

Best regards,
Tomasz
