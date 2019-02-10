From: Stuart Menefy <stuart.menefy@mathembedded.com>
Subject: [PATCH 0/2] Subject: [PATCH 0/2] clocksource: exynos_mct: Clear timer
 interrupt when shutting down
Date: Sun, 10 Feb 2019 22:51:12 +0000
Message-ID: <20190210225114.20110-1-stuart.menefy@mathembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-samsung-soc@vger.kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

When debugging suspend problems on Exynos 5260, I had a large number
of debugging prints going to the serial port after interrupts
had been disabled but before the timer interrupt was shutdown. This
was long enough for a timer tick to occur, but as interrupts were
disabled the ISR didn't run, and so the interrupt wasn't cleared.
Later when the timer was shutdown the interrupt was left asserted and
so the wfi at the heart of the suspend code didn't wait, causing
the suspend to fail.

Currently the code which stops the timer when it is on one-shot mode
and the interrupt occurs is in exynos4_mct_tick_clear(), meaning if we
called this from the shutdown code exynos4_mct_tick_stop() could be
called twice. So first restructure the existing code, so the check for
one-shot mode and stopping the timer is moved to the ISR, leaving
exynos4_mct_tick_clear() just clearing the interrupt flag.

Once this has been done simply call exynos4_mct_tick_clear() from
set_state_shutdown().

Stuart Menefy (2):
  clocksource: exynos_mct: Move one-shot check from tick clear to ISR
  clocksource: exynos_mct: Clear timer interrupt when shutdown

 drivers/clocksource/exynos_mct.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

-- 
2.13.6
