From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH 1/1] ARM: multi_v7_defconfig: Enable Exynos5420
 Multi-Cluster PM support
Date: Wed, 28 Jan 2015 14:59:03 -0800
Message-ID: <20150128225903.GA3177@quad.lixom.net>
References: <1422456020-10975-1-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1422456020-10975-1-git-send-email-javier.martinez@collabora.co.uk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Kevin Hilman <khilman@linaro.org>, arm@kernel.org, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Jan 28, 2015 at 03:40:20PM +0100, Javier Martinez Canillas wrote:
> The Exynos5420 cluster power management support allowing Exynos
> 5420/5422/5800 machines to power up and down the secondary CPUs.
> 
> Without this option enabled, the secondary CPUs are not brought
> up on boot and the following error is shown:
> 
> CPU0: thread -1, cpu 0, socket 0, mpidr 80000000
> Setting up static identity map for 0x40938e90 - 0x40938f28
> ARM CCI driver probed
> CPU1: failed to boot: -38
> CPU2: failed to boot: -38
> CPU3: failed to boot: -38
> CPU4: failed to boot: -38
> CPU5: failed to boot: -38
> CPU6: failed to boot: -38
> CPU7: failed to boot: -38
> Brought up 1 CPUs
> 
> Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>

Applied, thanks.


-Olof
