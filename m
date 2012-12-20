From: tomasz.figa@gmail.com
Subject: Re: [PATCH v2 3/3] ARM: EXYNOS5: save CLK_TOP_SRC3 register before
 powergating
Date: Thu, 20 Dec 2012 22:06:27 +0100
Message-ID: <21192551.mmsSZImfn7@flatron>
References: <CAPmaG0uqkRcoUBR8Gjv_+BSJ3hwxUCz0G-YKNQX=qvx83i6QOQ@mail.gmail.com>
 <1356006378-17441-4-git-send-email-prasanna.ps@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1356006378-17441-4-git-send-email-prasanna.ps@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Prasanna Kumar <prasanna.ps@samsung.com>
Cc: kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org, thomas.abraham@linaro.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi Prasanna,

On Thursday 20 of December 2012 17:56:18 Prasanna Kumar wrote:
> This patch adds a software workaround to the hardware
> problem found in exynos5 while powergating.
> 
> It is observed that CLK_TOP_SRC3 register gets modified if
> the G-Scaler/MFC devices are power gated. The clock for G-Scaler gets
> set to XXTI which results in the device running very slow .
> A big drop in performance is noticed whilerunning the video.
> This issue also occurs while powergating MFC.
> 
> The value of clock source register is restored once the powergating
> operation is completed.

Is the problem really related to power gating at all? From what you 
described in comment in the code, it seems like it's a problem with 
suspend/resume, not power gating, so it should be rather saved on suspend 
and restored on resume. Please recheck clock save/restore part of power 
management code.

Altering clock configuration registers from power domain code looks really 
ugly...

Best regards,
Tomasz Figa
