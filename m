From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH] ARM: dts: fix bad merge of display timing node to
 exynos5250-smdk5250.dts
Date: Mon, 8 Apr 2013 12:41:28 -0700
Message-ID: <CAD=FV=X7-DvuCpPeJwKDZeacbRzR+oB+upzzg=PK3_PmSnxbig@mail.gmail.com>
References: <1365439879-3398-1-git-send-email-dianders@chromium.org>
 <51630C7C.9040003@gmail.com>
 <CAD=FV=UcKTBjKtyQFY4odTpBDKbNQEAHjyahqgNCsD570zq=pw@mail.gmail.com>
 <2824266.emLkgITIHc@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <2824266.emLkgITIHc@flatron>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, Leela Krishna Amudala <l.krishna@samsung.com>, Jingoo Han <jg1.han@samsung.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Kukjin Kim <kgene.kim@gmail.com>, Thomas Abraham <thomas.abraham@linaro.org>, Olof Johansson <olof@lixom.net>, Kukjin Kim <kgene.kim@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Rahul Sharma <rahul.sharma@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Tomasz,

On Mon, Apr 8, 2013 at 12:27 PM, Tomasz Figa <tomasz.figa@gmail.com> wrote:
> Common Clock Framework by default automatically gates unused clocks, just
> like regulator core does with unused regulators. Maybe this is the cause?

Yes, I'm nearly certain that's the case here.  The reset code doesn't
belong to any driver (it's in mach-exynos/common.c) it certainly
doesn't grab any clock.

I tried quickly to see if there was an easy clock to grab but got a
bit stuck.  In the old way of doing things clocks could be global and
grabbed without a dev node.  That may still be possible now, but in
the 15 minutes I spent I couldn't figure it out and so it went to the
back burner.  ...or we could make a real reset device, but that might
be overkill?

> There is a CLK_IGNORE_UNUSED flag which disables this behavior for all
> clocks which have it set. Maybe it should be set for the problematic
> clock?

Didn't know about that one, thanks!  It seems like a bit annoying that
we'd have to keep this clock all the time just to get reset working,
though.  I guess in 3.4 that's what we did, though I don't know if it
was intentional...

-Doug
