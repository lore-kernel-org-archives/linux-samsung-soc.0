From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Please remind 'WARNING: about Samsung merge window over'
Date: Mon, 02 Aug 2010 14:52:01 +0900
Message-ID: <003401cb3206$d68a1fc0$839e5f40$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-language: ko
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: 'Russell King - ARM Linux' <linux@arm.linux.org.uk>, ben-linux@fluff.org
List-Id: linux-samsung-soc@vger.kernel.org

Please remind following which is from discussion about Samsung merge stuff
with Russell.

---

> > So, please send the majority of patches *before* the merge window and
> > try to avoid sending anything but fixes during the merge window itself.
> > The merge window is for code which has _already_ been merged and has
> > been in linux-next to be merged into Linus' tree.  It's not for new
> > code to be reviewed.
> 
> Next merge window, which will probably be the last I will handle for the
> S5P range, will have an earlier cut-off point. It was a big rush to get
> this lot reviewed and merged.

It also means that *NONE* of the stuff in your second pull request was
in linux-next for *any* time.  It also conflicted with my tree.  The
result of that is I'm expecting mainline to be dead for all ARM with:

arch/arm/Kconfig:883: can't open file "arch/arm/plat-s5pc1xx/Kconfig"

because of a mis-merge - and since that conflict was not picked up by
linux-next, it could not have been previously published.

For the next merge window, I will avoid reading email for the duration
of the window - which means those who are late for the merge window will
simply not have their patches and trees pulled.  This means we _will_
have time to resolve conflicts and find problems _before_ the merge
window

---

I have no more plan to merge s5p stuff for this merge window, but reviewed
here until now.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
