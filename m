From: Kyoungil Kim <ki0351.kim@samsung.com>
Subject: RE: [PATCH] serial: samsung: protect NULL dereference of clock name
Date: Wed, 30 May 2012 18:28:03 +0900
Message-ID: <001701cd3e46$8372bce0$8a5836a0$%kim@samsung.com>
References: <001401cd3e3e$644fd3a0$2cef7ae0$%kim@samsung.com>
 <CAM=Q2csPTE=5sc+kxnW6d+trf04OknFtRoxq4NGu8PkoAhOOxg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-serial-owner@vger.kernel.org>
In-reply-to: <CAM=Q2csPTE=5sc+kxnW6d+trf04OknFtRoxq4NGu8PkoAhOOxg@mail.gmail.com>
Content-language: ko
Sender: linux-serial-owner@vger.kernel.org
To: 'Shubhrajyoti Datta' <omaplinuxkernel@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-serial@vger.kernel.org, 'Kukjin Kim' <kgene.kim@samsung.com>, 'Alan Cox' <alan@linux.intel.com>, 'KeyYoung Park' <keyyoung.park@samsung.com>, 'Huisung Kang' <hs1218.kang@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Shubhrajyoti Datta wrote:
> Hi Kim,
> On Wed, May 30, 2012 at 1:59 PM, Kyoungil Kim <ki0351.kim@samsung.com> wrote:
> > From: KeyYoung Park <keyyoung.park@samsung.com>
> >
> > When priting the serial clock source, if clock source name is null,
> > kernel reference NULL point.
> >
> Could you help me understand why is that NULL ? Or the crash that you saw.

When you want to see the serial clock source name like using cat command before you open the tty, 
You can see the kernel crash.
I know this is not normal scenario.
This patch just prevents the kernel panic.

