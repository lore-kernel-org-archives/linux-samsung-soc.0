From: Ben Dooks <ben-linux@fluff.org>
Subject: [PULL] Please pull bjdooks' for-linus/samsung
Date: Fri, 22 Jan 2010 01:16:43 +0000
Message-ID: <20100122011642.GJ26562@trinity.fluff.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: torvalds@linux-foundtion.org, linux-arm-kernel@lists.infradead.org, Linux Samsung SoC <linux-samsung-soc@vger.kernel.org>
Cc: linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

A fix for the HMT machine's backlight code

The following changes since commit 3ce2f76f5dfeeacd128db9e5cd6945bac0ea0b2a:
  Ben Dooks (1):
        ARM: MINI2440: Fixup __initdata usage

are available in the git repository at:

  git://git.fluff.org/bjdooks/linux.git for-linus/samsung

Peter Korsgaard (1):
      hmt: adjust for new pwm_backlight->notify prototype

 arch/arm/mach-s3c6410/mach-hmt.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

-- 
Ben

Q:      What's a light-year?
A:      One-third less calories than a regular year.
