From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] ARM: dts: exynos: Add power button for Odroid XU3/4
Date: Mon, 6 Mar 2017 09:24:48 +0200
Message-ID: <CAJKOXPcwzy_hAMLoUNcJxYHjHfUF+YmeqSLPy2spvyCwck=TaA@mail.gmail.com>
References: <1488768729-9435-1-git-send-email-brian.kim@hardkernel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1488768729-9435-1-git-send-email-brian.kim@hardkernel.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Brian Kim <brian.kim@hardkernel.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, =?UTF-8?Q?=C5=81ukasz_Majewski?= <l.majewski@samsung.com>, linux-samsung-soc@vger.kernel.org, linux.amoon@gmail.com, linux-kernel@vger.kernel.org, Javier Martinez Canillas <javier@osg.samsung.com>, robh+dt@kernel.org, kgene@kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, Mar 6, 2017 at 4:52 AM, Brian Kim <brian.kim@hardkernel.com> wrote:
> The power button on Odroid XU3/4 is connected with the PWRON pin of
> s2mps11 PMIC. The s2mps11 sends low signal to GPIO input in exynos 5422
> via ONOB pin.
>
> This patch adds devicetree bindings for the power button of Odroid
> XU3/4.
>
> Signed-off-by: Brian Kim <brian.kim@hardkernel.com>
> ---
>  arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>

Hi,

Thanks for the patch.

You sent almost the same patch as Anand did some time ago (with few
missing things) :
https://patchwork.kernel.org/patch/8388491/

All previous comments apply, including that you added a key for gpx0-3
which is not a PWRON and it does not match description at all.

Best regards,
Krzysztof
