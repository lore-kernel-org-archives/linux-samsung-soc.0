From: "krzk@kernel.org" <krzk@kernel.org>
Subject: Re: [PATCH 0/2] Fix init order of S3C64xx's clock providers
Date: Mon, 9 Sep 2019 20:45:04 +0200
Message-ID: <20190909184504.GA10091@kozik-lap>
References: <BY5PR12MB3699A8D741EF6226B8DB65E4C4B50@BY5PR12MB3699.namprd12.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <BY5PR12MB3699A8D741EF6226B8DB65E4C4B50@BY5PR12MB3699.namprd12.prod.outlook.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Yao Lihua <ylhuajnu@outlook.com>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "kgene@kernel.org" <kgene@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Sat, Sep 07, 2019 at 02:47:48AM +0000, Yao Lihua wrote:
> From: Lihua Yao <ylhuajnu@outlook.com>
> 
> Ensure fin_pll is initialized before clock-controller@7e00f000 so
> we have correct clock frequency like below:
> 
> [    0.000000] S3C6410 clocks: apll = 532000000, mpll = 532000000
> [    0.000000]  epll = 24000000, arm_clk = 532000000

Hi,

Unfortunately your patches missed the samsung-soc mailing list:
https://www.spinics.net/lists/linux-samsung-soc/

Maybe you need to be subscribed?

In general, if the patches are not there, I do not see them under
Patchwork. You miss also review from Samsung folks.

Best regards,
Krzysztof


> 
> Lihua Yao (2):
>   ARM: dts: s3c64xx: factor out external fixed clocks
>   ARM: dts: s3c64xx: specify dependency of clock providers
> 
>  arch/arm/boot/dts/s3c6400.dtsi         |  1 +
>  arch/arm/boot/dts/s3c6410-mini6410.dts | 22 ----------------------
>  arch/arm/boot/dts/s3c6410-smdk6410.dts | 22 ----------------------
>  arch/arm/boot/dts/s3c6410.dtsi         |  1 +
>  arch/arm/boot/dts/s3c64xx.dtsi         | 14 ++++++++++++++
>  5 files changed, 16 insertions(+), 44 deletions(-)
> 
> -- 
> 2.17.1
> 
