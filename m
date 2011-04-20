From: Nick Pelling <nickpelling@nanodome.com>
Subject: Re: Cleanup Samsung stuff
Date: Wed, 20 Apr 2011 08:46:41 +0100
Message-ID: <9fibsi$eg5ubh@out1.ip07ir2.opaltelecom.net>
References: <012801cbfe33$a76fa490$f64eedb0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <012801cbfe33$a76fa490$f64eedb0$%kim@samsung.com>
References: <012801cbfe33$a76fa490$f64eedb0$%kim@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Kukjin Kim <kgene.kim@samsung.com>, 'LAK' <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi Kgene,

At 10:46 19/04/2011 +0900, Kukjin Kim wrote:
>As a note, I'm doing(or preparing) following at the moment.
>- Removing some "mach-s5pxxxx"s

Are you planning to remove mach-s5pc100? If yes, is this with the 
intention of reducing arch/arm code size (by merging, say, with the 
s5pc110 tree), or because of some upcoming Samsung EOL event? :-(

(I'm building security cameras based on the s5pc100, working with 
mach-s5pc100 issues every day).

Best regards, ....Nick Pelling.... 
