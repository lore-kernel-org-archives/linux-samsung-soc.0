From: Ben Dooks <ben@trinity.fluff.org>
Subject: Re: [PATCH] watchdog: s3c2410_wdt: Only register for cpufreq on
 CPU_FREQ_S3C24XX
Date: Tue, 26 Nov 2013 00:08:31 +0000
Message-ID: <20131126000831.GW12108@trinity.fluff.org>
References: <1385420137-32725-1-git-send-email-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1385420137-32725-1-git-send-email-dianders@chromium.org>
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
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-watchdog@vger.kernel.org, Leela Krishna Amudala <l.krishna@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, linux-kernel@vger.kernel.org, Wim Van Sebroeck <wim@iguana.be>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Ben Dooks <ben-linux@fluff.org>, Olof Johansson <olof@lixom.net>, Guenter Roeck <linux@roeck-us.net>
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, Nov 25, 2013 at 02:55:37PM -0800, Doug Anderson wrote:
> On modern SoCs the watchdog timer is parented on a clock that doesn't
> change every time we have a cpufreq change.  That means we don't need
> to constantly adjust the watchdog timer, so avoid registering for and
> dealing with cpufreq transitions unless we've actually got
> CPU_FREQ_S3C24XX defined.

The S3C2410 to at-least S3C2440 there is only one PLL/clock-divider
set so changing any part of that can change frequency supplied to
the watchdog.
