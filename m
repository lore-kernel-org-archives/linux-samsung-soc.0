From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH 04/12] clocksource: samsung-time: Move samsung-time.h
 header to include/linux
Date: Mon, 11 Feb 2013 10:36:02 +0000
Message-ID: <20130211103602.GB32455@e106331-lin.cambridge.arm.com>
References: <1360502423-2246-1-git-send-email-tomasz.figa@gmail.com>
 <1360502423-2246-5-git-send-email-tomasz.figa@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1360502423-2246-5-git-send-email-tomasz.figa@gmail.com>
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
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: "arhuaco@freaks-unidos.net" <arhuaco@freaks-unidos.net>, Kukjin Kim <kgene.kim@samsung.com>, "linux@arm.linux.org.uk" <linux@arm.linux.org.uk>, "kwangwoo.lee@gmail.com" <kwangwoo.lee@gmail.com>, "guillaume.gourat@nexvision.tv" <guillaume.gourat@nexvision.tv>, "broonie@opensource.wolfsonmicro.com" <broonie@opensource.wolfsonmicro.com>, "mcuelenaere@gmail.com" <mcuelenaere@gmail.com>, "jekhor@gmail.com" <jekhor@gmail.com>, "danders@amltd.com" <danders@amltd.com>, "kyungmin.park@samsung.com" <kyungmin.park@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "bhmin@samsung.com" <bhmin@samsung.com>, "jacmet@sunsite.dk" <jacmet@sunsite.dk>, "augulis.darius@gmail.com" <augulis.darius@gmail.com>, "christer@weinigel.se" <christer@weinigel.se>, "linux@simtec.co.uk" <linux@simtec.co.uk>, "ghcstop@gmail.com" <ghcstop@gmail.com>, Sylwester
List-Id: linux-samsung-soc@vger.kernel.org

On Sun, Feb 10, 2013 at 01:20:15PM +0000, Tomasz Figa wrote:
> This patch moves the samsung-time.h header file to include/linux
> directory and fixes all references to it.

Perhaps include/clocksource would be better?

Thanks,
Mark.
