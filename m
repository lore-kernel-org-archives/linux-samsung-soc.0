From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH v2] ARM: exynos: add debug_ll_io_init() call in
 exynos_init_io()
Date: Wed, 5 Jun 2013 14:12:17 -0700
Message-ID: <CAOesGMhQX9ip=nb9AQa5fcDFRNpZZSxUO0N0GTX051dakWZD9Q@mail.gmail.com>
References: <1370397539-21653-1-git-send-email-dianders@chromium.org>
 <1370465793-7997-1-git-send-email-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1370465793-7997-1-git-send-email-dianders@chromium.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Doug Anderson <dianders@chromium.org>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Russell King <linux@arm.linux.org.uk>, Simon Glass <sjg@chromium.org>, Tomasz Figa <tomasz.figa@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, Ben Dooks <ben-linux@fluff.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Jun 5, 2013 at 1:56 PM, Doug Anderson <dianders@chromium.org> wrote:
> If the early MMU mapping of the UART happens to get booted out of the
> TLB between the start of paging_init() and when we finally re-add the
> UART at the very end of s3c_init_cpu(), we'll get a hang at bootup if
> we've got early_printk enabled.  Avoid this hang by calling
> debug_ll_io_init() early.
>
> Without this patch, you can reliably reproduce a hang when early
> printk is enabled by adding flush_tlb_all() at the start of
> exynos_init_io().  After this patch the hang goes away.
>
> Signed-off-by: Doug Anderson <dianders@chromium.org>

Acked-by: Olof Johansson <olof@lixom.net>


Kukjin, this seems appropriate for 3.10. Do you have other fixes
queued or should I apply this directly?


-Olof
