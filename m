From: Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v2 0/4] ARM: dts: Add LCD and PWM support for
 exynos4210-origen
Date: Wed, 19 Jun 2013 02:15:29 +0900
Message-ID: <51C095B1.4090809@samsung.com>
References: <1370932192-19365-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1370932192-19365-1-git-send-email-sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
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
Cc: kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On 06/11/13 15:29, Sachin Kamat wrote:
> This series is based on for-next branch of Kukjin's tree.
> Tested on Origen board.
>
> Changes since v1:
> * Split LCD patch into LCD and PWM as suggested by Tomasz Figa.
> * Added all PWM output nodes to pinctrl dtsi file.
>
> Sachin Kamat (3):
>    ARM: dts: exynos4210: Add PWM related pinctrl entries
>    ARM: dts: exynos4210: Add LCD related pinctrl entries
>    ARM: dts: Add FIMD node to Origen4210 board
>
> Tushar Behera (1):
>    ARM: dts: Set BUCK7 as always on for Origen board
>
>   arch/arm/boot/dts/exynos4210-origen.dts   |   22 +++++++
>   arch/arm/boot/dts/exynos4210-pinctrl.dtsi |   89 +++++++++++++++++++++++++++++
>   2 files changed, 111 insertions(+)
>
Applied, thanks.

- Kukjin
