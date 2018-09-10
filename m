From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [BUG BISECT] NFS root failure (NULL pointer)
Date: Mon, 10 Sep 2018 08:46:40 +0200
Message-ID: <CAJKOXPdTigJ7DZO3CiHM=zrWqb9MebNmbpbeJB5w0UDWS9FbqA@mail.gmail.com>
References: <CAJKOXPc49jh8RCDvn2Meci9iDcnnwGEHo6F7RuhkXpen=f_E8w@mail.gmail.com>
 <CAJKOXPfc5O0c6HBtM=h2NUXwaiCWVgFC9eVeirLYynfUpU6d3Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAJKOXPfc5O0c6HBtM=h2NUXwaiCWVgFC9eVeirLYynfUpU6d3Q@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: dhowells@redhat.com, ebiggers@google.com, viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, 10 Sep 2018 at 08:44, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On Thu, 6 Sep 2018 at 09:10, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >
> > Hi,
> >
> > Today's next fails to mount NFS root under my ARM targets and fails to
> > mount root from file image under QMU.
> >
> > [ 21.512866] Unable to handle kernel NULL pointer dereference at
> > virtual address 00000000
> > [ 21.695484] [<c03bcc04>] (nfs_fs_mount) from [<c02cf6a4>]
> > (legacy_get_tree+0x34/0xec)
> > [ 21.703225] [<c02cf6a4>] (legacy_get_tree) from [<c029442c>]
> > (vfs_get_tree+0x64/0x180)
> > [ 21.711119] [<c029442c>] (vfs_get_tree) from [<c02b9140>]
> > (do_mount+0x21c/0x958)
> > [ 21.718478] [<c02b9140>] (do_mount) from [<c02b9c38>] (ksys_mount+0x8c/0xbc)
> > [ 21.725513] [<c02b9c38>] (ksys_mount) from [<c0101000>]
> > (ret_fast_syscall+0x0/0x28)
> >
> > Full log from ARM (NFS root):
> > https://krzk.eu/#/builders/25/builds/750/steps/12/logs/serial0
> >
> > The NFS root failure bisected to:
> > bae551929c5433bd56ec4dcb97c7d4a50153d357 is the first bad commit
> > commit bae551929c5433bd56ec4dcb97c7d4a50153d357
> > Author: David Howells <dhowells@redhat.com>
> > Date:   Tue Jul 10 21:43:37 2018 +0100
>
> FYI, the bug is still present in linux-next. All boards fail to boot up.
>
> Let me know if I can help anymore in debugging this.

Hm, my mistake. Today's next boots up fine. Seems fixed. Thanks!

Best regards,
Krzysztof
