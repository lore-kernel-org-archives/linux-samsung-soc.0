From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [RFT v2 06/48] pinctrl: Use irq_desc_get_xxx() to avoid redundant
 lookup of irq_desc
Date: Fri, 5 Jun 2015 12:06:06 +0900
Message-ID: <CA+Ln22Euot24co7qKLTej43j3Z2BS-p5WhjRq9WgRb-+U=Tyqw@mail.gmail.com>
References: <1433391238-19471-1-git-send-email-jiang.liu@linux.intel.com>
	<1433391238-19471-7-git-send-email-jiang.liu@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1433391238-19471-7-git-send-email-jiang.liu@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jiang Liu <jiang.liu@linux.intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Bjorn Helgaas <bhelgaas@google.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Randy Dunlap <rdunlap@infradead.org>, Yinghai Lu <yinghai@kernel.org>, Borislav Petkov <bp@alien8.de>, Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Alessandro Rubini <rubini@unipv.it>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Heiko Stuebner <heiko@sntech.de>, Srinivas Kandagatla <srinivas.kandagatla@gmail.com>, Maxime Coquelin <maxime.coquelin@st.com>, Patrice Chotard <patrice.chotard@st.com>, Thomas Abraham <thomas.abraham@linaro.org>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Barry
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

2015-06-04 13:13 GMT+09:00 Jiang Liu <jiang.liu@linux.intel.com>:
> Use irq_desc_get_xxx() to avoid redundant lookup of irq_desc while we
> already have a pointer to corresponding irq_desc.
>
> Signed-off-by: Jiang Liu <jiang.liu@linux.intel.com>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/pinctrl/intel/pinctrl-cherryview.c    |    2 +-
>  drivers/pinctrl/intel/pinctrl-intel.c         |    2 +-
>  drivers/pinctrl/mediatek/pinctrl-mtk-common.c |    4 ++--
>  drivers/pinctrl/nomadik/pinctrl-nomadik.c     |   12 +++++-------
>  drivers/pinctrl/pinctrl-amd.c                 |    2 +-
>  drivers/pinctrl/pinctrl-at91.c                |    2 +-
>  drivers/pinctrl/pinctrl-coh901.c              |    4 ++--
>  drivers/pinctrl/pinctrl-rockchip.c            |    4 ++--
>  drivers/pinctrl/pinctrl-single.c              |    2 +-
>  drivers/pinctrl/pinctrl-st.c                  |    6 +++---
>  drivers/pinctrl/qcom/pinctrl-msm.c            |    2 +-
>  drivers/pinctrl/samsung/pinctrl-exynos.c      |    8 ++++----
>  drivers/pinctrl/samsung/pinctrl-s3c24xx.c     |   18 +++++++++---------
>  drivers/pinctrl/samsung/pinctrl-s3c64xx.c     |   22 ++++++++++------------

For Samsung stuff:

Acked-by: Tomasz Figa <tomasz.figa@gmail.com>

Best regards,
Tomasz
