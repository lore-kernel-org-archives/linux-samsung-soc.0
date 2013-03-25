From: Tushar Behera <tushar.behera-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 0/2] ARM: dts: Add default pin states for client nodes
 on Exynos4/5 platforms
Date: Mon, 25 Mar 2013 12:19:35 +0530
Message-ID: <514FF37F.7090405@linaro.org>
References: <1362573398-15126-1-git-send-email-thomas.abraham@linaro.org>
 <CACRpkdbsCpV5_P=z44CMvsgps=AS9C62oprn6To6ExhoWZkvhA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CACRpkdbsCpV5_P=z44CMvsgps=AS9C62oprn6To6ExhoWZkvhA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
To: kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
Cc: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On 03/07/2013 01:45 PM, Linus Walleij wrote:
> On Wed, Mar 6, 2013 at 1:36 PM, Thomas Abraham
> <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> 
>> This patch series populates the default pin states in client nodes
>> of Exynos4 and Exynos5 platforms. Exynos4/5 platforms are migrating
>> to use pinctrl framework and having the default pin states listed
>> in the client nodes allows the device core to setup the default
>> pin configuration for all the controllers.
> 
> The series:
> Acked-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> 
> Yours,
> Linus Walleij
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

Kukjin,

Would you be applying this patch-set to your tree? We need that to
rebase Arndale related patches for v3.10.


-- 
Tushar Behera
