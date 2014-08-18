From: Vikas Sajjan <vikas.sajjan@samsung.com>
Subject: Re: [PATCH v3 0/2] Refactor the pm code to use DT based lookup
Date: Mon, 18 Aug 2014 16:03:57 +0530
Message-ID: <CAGm_ybjZBfmpv2t5kuCvd7F+vMh4mZK+1ULdXuZCRBtEjXMQuA@mail.gmail.com>
References: <1407412789-1919-1-git-send-email-vikas.sajjan@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1407412789-1919-1-git-send-email-vikas.sajjan@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>
Cc: Vikas Sajjan <sajjan.linux@gmail.com>, Olof Johansson <olof@lixom.net>, Kukjin Kim <kgene.kim@samsung.com>, sunil joshi <joshi@samsung.com>, Doug Anderson <dianders@chromium.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi All,

On Thu, Aug 7, 2014 at 5:29 PM, Vikas Sajjan <vikas.sajjan@samsung.com> wrote:
> Refactoring the pm.c to avoid using "soc_is_exynos" checks,
> instead use the DT based lookup.
>
> While at it, move exynos5250 specific disabling of JPEG USE_RETENTION to pmu.c
>
> changes since v2:
>         - Addressed Tomasz Figa's comments to unify the functions for exynos4
>         and exynos5250.
>         - Added new patch to move exynos5250 specific disabling of
>                 JPEG USE_RETENTION to pmu.c
>         - Addressed comment from Thomas Abraham.
> changes since v1:
>         - Address Kukjin Kim comments to respin this patch separately from
>                 http://lists.infradead.org/pipermail/linux-arm-kernel/2014-July/272574.html
>         - removed panic, returned if no PMU node found and added check in exynos_wkup_irq.
>
> Rebased on Kukjin Kim's tree, for-next branch
>         https://git.kernel.org/cgit/linux/kernel/git/kgene/linux-samsung.git/log/?h=for-next
>
> Vikas Sajjan (2):
>   ARM: EXYNOS: Move Disabling of JPEG USE_RETENTION for exynos5250 to
>     pmu.c
>   ARM: EXYNOS: Refactor the pm code to use DT based lookup
>
>  arch/arm/mach-exynos/pm.c       |  173 ++++++++++++++++++++++++++++-----------
>  arch/arm/mach-exynos/pmu.c      |    6 ++
>  arch/arm/mach-exynos/regs-pmu.h |    1 +
>  3 files changed, 132 insertions(+), 48 deletions(-)


Anymore  comments on this series...


>
> --
> 1.7.9.5
>
