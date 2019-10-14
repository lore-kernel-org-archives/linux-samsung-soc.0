From: syzbot <syzbot+c0b807de416427ff3dd1@syzkaller.appspotmail.com>
Subject: Re: WARNING in batadv_iv_send_outstanding_bat_ogm_packet
Date: Sun, 13 Oct 2019 20:57:01 -0700
Message-ID: <0000000000002ba5570594d6dc99@google.com>
References: <00000000000059b6d40594d0f776@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <00000000000059b6d40594d0f776@google.com>
Sender: netdev-owner@vger.kernel.org
To: a@unstable.cc, akpm@osdl.org, arvind.yadav.cs@gmail.com, b.a.t.m.a.n@lists.open-mesh.org, davem@davemloft.net, kgene@kernel.org, krzk@kernel.org, kyungmin.park@samsung.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org, mareklindner@neomailbox.ch, mchehab@kernel.org, mchehab@s-opensource.com, mingo@kernel.org, netdev@vger.kernel.org, oleg@tv-sign.ru, roland@redhat.com, s.nawrocki@samsung.com, sven@narfation.org, sw@simonwunderlich.de, syzkaller-bugs@googlegroups.com, viro@zeniv.linux.org.uk
List-Id: linux-samsung-soc@vger.kernel.org

syzbot has bisected this bug to:

commit 26d051e301f67cdd2ea3404abb43902f13214efa
Author: Arvind Yadav <arvind.yadav.cs@gmail.com>
Date:   Thu Jun 29 08:21:35 2017 +0000

     media: exynos4-is: fimc-is-i2c: constify dev_pm_ops structures

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=10a0aff0e00000
start commit:   da940012 Merge tag 'char-misc-5.4-rc3' of git://git.kernel..
git tree:       upstream
final crash:    https://syzkaller.appspot.com/x/report.txt?x=12a0aff0e00000
console output: https://syzkaller.appspot.com/x/log.txt?x=14a0aff0e00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=2d2fd92a28d3e50
dashboard link: https://syzkaller.appspot.com/bug?extid=c0b807de416427ff3dd1
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=141ffd77600000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=11edd580e00000

Reported-by: syzbot+c0b807de416427ff3dd1@syzkaller.appspotmail.com
Fixes: 26d051e301f6 ("media: exynos4-is: fimc-is-i2c: constify dev_pm_ops  
structures")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
