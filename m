From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RFC v1 06/25] pinctrl: Use irq_desc_get_xxx() to avoid redundant
 lookup of irq_desc
Date: Mon, 1 Jun 2015 14:46:34 +0200
Message-ID: <CACRpkdazXuq7WZZPiObRNFBTokazUN9yisU7VNobS4ezgZTHJw@mail.gmail.com>
References: <1432116013-25902-1-git-send-email-jiang.liu@linux.intel.com>
 <1432116013-25902-7-git-send-email-jiang.liu@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1432116013-25902-7-git-send-email-jiang.liu@linux.intel.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jiang Liu <jiang.liu@linux.intel.com>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Heiko Stuebner <heiko@sntech.de>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Tomasz Figa <tomasz.figa@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Maoguang Meng <maoguang.meng@mediatek.com>, "H. Peter Anvin" <hpa@zytor.com>, kernel@stlinux.com, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Axel Lin <axel.lin@ingics.com>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Hongzhou Yang <hongzhou.yang@mediatek.com>, Yinghai Lu <yinghai@kernel.org>, x86@kernel.org, ACPI Devel Maling List <linux-acpi@vger.kernel.org>, Chen-Yu Tsai <wens@csie.org>, Ingo Molnar <mingo@redhat.com>, Thomas Abraham <thomas.abraham@linaro.org>, Bjorn Andersson <bjorn.andersson@sonymobile.com>lin
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, May 20, 2015 at 11:59 AM, Jiang Liu <jiang.liu@linux.intel.com> wrote:

> Use irq_desc_get_xxx() to avoid redundant lookup of irq_desc while we
> already have a pointer to corresponding irq_desc.
>
> Signed-off-by: Jiang Liu <jiang.liu@linux.intel.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Are there dependencies on this patch or can I just apply it
directly to the GPIO tree?

Yours,
Linus Walleij
