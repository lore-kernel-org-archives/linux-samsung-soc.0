From: Ben Dooks <ben-linux@fluff.org>
Subject: Re: [PATCH 11/11] ARM: S5P6440: Remove redundant defines
Date: Fri, 14 May 2010 03:12:42 +0100
Message-ID: <20100514021242.GO26401@trinity.fluff.org>
References: <1273710481-14856-1-git-send-email-kgene.kim@samsung.com>
	<AANLkTimTm_Vxvb2xvJnVxTxUaYguFgGeaWGypzA1yjwM@mail.gmail.com>
	<20100513020236.GS6684@trinity.fluff.org>
	<AANLkTilIvm2AlZeh_1cdcgZFFL5YuJUnYiytXA2tZktB@mail.gmail.com>
	<20100513090608.GA5382@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20100513090608.GA5382@n2100.arm.linux.org.uk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Kyungmin Park <kmpark@infradead.org>, Jassi Brar <jassisinghbrar@gmail.com>, linux-samsung-soc@vger.kernel.org, Thomas Abraham <thomas.ab@samsung.com>, Ben Dooks <ben-linux@fluff.org>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, May 13, 2010 at 10:06:08AM +0100, Russell King - ARM Linux wrote:
> On Thu, May 13, 2010 at 01:54:12PM +0900, Kyungmin Park wrote:
> > On Thu, May 13, 2010 at 11:02 AM, Ben Dooks <ben-linux@fluff.org> wrote:
> > > 1) It takes two lines of code, where one is sufficient.
> > >
> > > 2) You only have to look in the relevant .c file to find out the
> > > =A0 value instead of tracking down a header. This makes it easier
> > > =A0 to verify the value against the manual and easier to compare
> > > =A0 against simialr code.
> > =

> > Then define it at c code and use the macro. I also don't like the
> > hard-coded values.
> =

> I'm almost with Ben on this; but we can do better to satisfy both camps.
> =

> 	.ctrlbit	=3D 1 << 2, /* CLKCON_MEM0_HCLK_NFCON */
> =

> It's now documented what the magic constant is.

Gah, my braincell!

I should also point out that we are also trying to cut down on the large
headerfiles that are being poured into the kernel without things using
them and the likelyhood of not being used. It seems that people think
that the more output the more work has been done, which makes life harder
for anyone else looking at the code to review.

-- =

Ben

Q:      What's a light-year?
A:      One-third less calories than a regular year.
