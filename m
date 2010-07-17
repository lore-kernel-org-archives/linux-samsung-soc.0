From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH v2 2/5] ARM: S5P: Added default pll values for APLL
	800/1000MHz
Date: Sat, 17 Jul 2010 13:45:22 +0900
Message-ID: <AANLkTina0tKQ_2uTOrgNKtPRyAwOKo7QA4Y0dIxo-1Kl@mail.gmail.com>
References: <1279267277-6804-1-git-send-email-myungjoo.ham@samsung.com>
	<1279267277-6804-2-git-send-email-myungjoo.ham@samsung.com>
	<1279267277-6804-3-git-send-email-myungjoo.ham@samsung.com>
	<012f01cb24e1$85628920$90279b60$%kim@samsung.com>
	<AANLkTil5v3ypu0hZdzVmFCG7MsjQzTKPNgMtJQ-M6MHj@mail.gmail.com>
	<AANLkTinyx2Abgda7L-Z0XDeuftNv4tOPQ5HMdSsp6yUd@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <AANLkTinyx2Abgda7L-Z0XDeuftNv4tOPQ5HMdSsp6yUd@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Kyungmin Park <kyungmin.park@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, myungjoo.ham@gmail.com, MyungJoo Ham <myungjoo.ham@samsung.com>, ben-linux@fluff.org, Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

On Sat, Jul 17, 2010 at 1:09 PM, Kyungmin Park
<kyungmin.park@samsung.com> wrote:

> I don't say LSI need to support early chip. you focus on the your selected SoC.
> The remaining will be done by us.
Of course, you can do whatever you want.
I only worry that this mindless rush to push support for such obscure and rare
machines will create maintenance issues in future when we have some serious
updates to make in the core but don't have these rare machines to test.
There are already such antiquated boards supported but at least they
were popular
when the support was added and helped many users. These new additions don't
seem to serve any purpose other than shifting maintenance overhead
from the submitter
to mainline developers.

Just my personal opinion, I don't speak for my team.
