From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [GIT PULL 1/2] arm64: dts: exynos: Pull for v5.4
Date: Wed, 11 Sep 2019 23:07:17 +0200
Message-ID: <CAK8P3a2pBV+fh0rHitZ30Zz61QNRLfNSD-nhnzq4ZtxSh66F1Q@mail.gmail.com>
References: <20190911183632.4317-1-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190911183632.4317-1-krzk@kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: DTML <devicetree@vger.kernel.org>, "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>, Kukjin Kim <kgene@kernel.org>, Olof Johansson <olof@lixom.net>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Sep 11, 2019 at 8:36 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> Hi,
>
> Unfortunately the patches were applied right after closing the linux-next.

Hi Krzysztof,

I took a look at these and am not convinced this is right:

> 1. Fix boot of Exynos7 due to wrong address/size of memory node,

The current state is clearly broken and a fix is needed, but
I'm not sure this is the right fix. Why do you have 32-bit physical
addressing on a 64-bit chip? I looked at commit ef72171b3621
that introduced it, and it seems it would be better to just
revert back to 64-bit addresses.

> 2. Move GPU under /soc node,

No problem

> 3. Minor cleanup of #address-cells.

IIRC, an interrupt-controller is required to have a #address-cells
property, even if that is normally zero. I don't remember the
details, but the gic binding lists it as mandatory, and I think
the PCI interrupt-map relies on it. I would just drop this patch.

    Arnd
