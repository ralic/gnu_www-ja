# Copyright (C) 2007, 2008, 2009, 2010, 2011 Free Software Foundation, Inc.

# This file is part of GNUnited Nations.

# GNUnited Nations is free software: you can redistribute it and/or
# modify it under the terms of the GNU General Public License as
# published by the Free Software Foundation, either version 3 of the
# License, or (at your option) any later version.

# GNUnited Nations is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with GNUnited Nations. If not, see <http://www.gnu.org/licenses/>.

# TRANSLATORS: Add here your language code.  Please keep the
# alphabetical order.
TEMPLATE_LINGUAS := af ar bg ca cs de el es fa fr he id it ja ml nb nl pl pt \
                    pt-br ro ru sk sq sr ta tr uk vi zh-cn

# TRANSLATORS: If you have committed home.LANG.po, add here your
# language code.
HOME_LINGUAS := ar bg ca de el es fa fr id it ja nb nl pl pt-br ro ru sq \
		sr tr uk zh-cn

# TRANSLATORS: Add here your language code if you want PO files with wdiffs
# to previous msgids.
FUZZY_DIFF_LINGUAS := fr it pl ru

### The variables below are edited by GNUN maintainers. ###

# List of articles for which GRACE do not apply; i.e. they are
# regenerated even if there are fuzzy strings.
no-grace-articles := $(addprefix $(rootdir)/, \
			server/po/takeaction)

# List of additional templates
extra-templates := philosophy/philosophy-menu

# List of articles for which VALIDATE has no full effect; i.e. the
# HTML files are never validated.
#no-validate-articles := $(addprefix $(rootdir)/, \
#			   fry/po/happy-birthday-to-gnu, \
#                           education/po/education)

ALL_DIRS :=	accessibility \
		award \
		award/1998 \
		award/1999 \
		award/2000 \
		award/2001 \
		award/2002 \
		award/2003 \
		bulletins \
		contact \
		copyleft \
		distros \
		doc \
		education \
		education/misc \
		encyclopedia \
		events \
		fry \
		fun \
		fun/jokes \
		gnu \
		graphics \
		help \
		licenses \
		licenses/old-licenses \
		links \
		music \
		people \
		philosophy \
		philosophy/economics_frank \
		philosophy/sco \
		pronunciation \
		server \
		server/standards \
		software

ROOT :=		keepingup \
		provide

accessibility :=	accessibility

award :=	award \
		award-1998 \
		award-1999 \
		fsfawardlist

award/1998 :=	finalists \
		nominees

award/1999 :=	1999

award/2000 :=	2000

award/2001 :=	2001

award/2002 :=	2002

award/2003 :=	2003 \
		2003-call

bulletins :=	bulletins \
		thankgnus-index

contact :=	contact \
		gnu-advisory

copyleft :=	copyleft

distros :=	common-distros \
		distros \
		free-distros \
		free-system-distribution-guidelines \
		screenshot

doc :=	doc \
	other-free-books

education :=    edu-cases-argentina-ecen \
		edu-cases-argentina \
		edu-cases-india-ambedkar \
		edu-cases-india-irimpanam \
		edu-cases-india \
		edu-cases \
		edu-contents \
		edu-faq \
		edu-projects \
		edu-resources \
		edu-schools \
		edu-software-gcompris \
		edu-software-tuxpaint \
		edu-software \
		edu-system-india \
		edu-team \
		edu-why \
		education

education/misc :=    edu-misc

encyclopedia :=	encyclopedia \
		free-encyclopedia

events :=	dinner-20030807 \
		events \
		first-assoc-members-meeting \
		nyc-2004-01 \
		porto-tech-city-2001 \
		rms-nyu-2001-transcript \
		sco_without_fear \
		usenix-2001-lifetime-achievement

fry :=	happy-birthday-to-gnu \
	happy-birthday-to-gnu-credits \
	happy-birthday-to-gnu-download \
	happy-birthday-to-gnu-in-your-language \
	happy-birthday-to-gnu-sfd-kaffeine \
	happy-birthday-to-gnu-sfd-mplayer \
	happy-birthday-to-gnu-sfd-totem \
	happy-birthday-to-gnu-sfd-vlc \
	happy-birthday-to-gnu-sfd-xine \
	happy-birthday-to-gnu-translation

fun :=	humor

fun/jokes :=	10-kinds-of-people \
		anagrams \
		any-key \
		brainfuck \
		bug.war \
		c+- \
		clinton.tree \
		courtroom.quips \
		deadbeef \
		declarations \
		dna \
		doctor.manifesto \
		echo.msg \
		ed \
		ed.msg \
		errno.2 \
		error-haiku \
		eternal-flame \
		evilmalware \
		filks \
		foreign-signs \
		freesoftware \
		fsf-in-german \
		gcc_audio \
		gcc \
		gingrinch \
		gnuemacs.acro.exp \
		gnuemacs \
		gnu.jive \
		gnu-overflow \
		gnu-song \
		gospel \
		gullibility.virus \
		hackersong \
		hackforfreedom \
		hakawatha \
		hap-bash \
		happy-new-year.cfbC \
		helloworld \
		hello_world_patent \
		know.your.sysadmin \
		last.bug \
		linus-islam \
		purchase.agreement

gnu :=		about-gnu \
		byte-interview \
		gnu \
		gnu-history \
		gnu-linux-faq \
		gnu-users-never-heard-of-gnu \
		initial-announcement \
		linux-and-gnu \
		manifesto \
		rms-lisp \
		thegnuproject \
		why-gnu-linux

graphics :=	agnuhead \
		anfsflogo \
		atypinggnu \
		avatars \
		babygnu \
		bwcartoon \
		fsf-logo \
		gnu-ascii-liberty \
		gnuolantern \
		gnupascal \
		graphics \
		license-logos \
		package-logos \
		philosophicalgnu \
		whatsgnu

help :=		directory \
		evaluation \
		gethelp \
		help \
		help-hardware \
		linking-gnu

licenses :=	200104_seminar \
		210104_seminar \
		agpl-3.0 \
		exceptions \
		fdl-1.3 \
		fdl-1.3-faq \
		fdl-howto \
		fdl-howto-opt \
		gcc-exception-3.0 \
		gcc-exception-3.1 \
		gcc-exception-3.1-faq \
		gpl-3.0 \
		gpl-faq \
		gpl-howto \
		gpl-violation \
		gplv3-the-program \
		hessla \
		lgpl-3.0 \
		lgpl-java \
		license-list \
		license-recommendations \
		licenses \
		NYC_Seminars_Jan2004 \
		quick-guide-gplv3 \
		recommended-copylefts \
		rms-why-gplv3 \
		translations \
		why-affero-gpl \
		why-assign \
		why-gfdl \
		why-not-lgpl

licenses/old-licenses :=	fdl-1.1 \
				fdl-1.1-translations \
				fdl-1.2-translations \
				fdl-1.2 \
				gcc-exception-translations \
				gpl-1.0 \
				gpl-2.0 \
				gpl-2.0-faq \
				gpl-2.0-translations \
				lgpl-2.0 \
				lgpl-2.1 \
				lgpl-2.1-translations \
				old-licenses

links :=	companies \
		links

music :=	blues-song \
		emacsvsvi \
		free-software-song \
		gdb-song \
		music \
		till_there_was_gnu \
		writing-fs-song

people :=	people

philosophy := 	15-years-of-free-software \
		amazon \
		amazon-nat \
		amazon-rms-tim \
		android-and-users-freedom \
		apsl \
		assigning-copyright \
		basic-freedoms \
		bdk \
		boldrin-levine \
		bsd \
		can-you-trust \
		categories \
		censoring-emacs \
		compromise \
		computing-progress \
		copyright-and-globalization \
		copyright-versus-community \
		copyright-versus-community-2000 \
		danger-of-software-patents \
		dat \
		digital-inclusion-in-freedom \
		dmarti-patent \
		drdobbs-letter \
		ebooks \
		eldred-amicus \
		enforcing-gpl \
		essays-and-articles \
		europes-unitary-patent \
		fighting-software-patents \
		fire \
		free-digital-society \
		free-doc \
		freedom-or-copyright \
		freedom-or-copyright-old \
		freedom-or-power \
		free-software-for-freedom \
		free-software-intro \
		free-sw \
		free-world \
		free-world-notes \
		fs-motives \
		fs-translations \
		gates \
		gif \
		gnutella \
		google-engineering-talk \
		government-free-software \
		gpl-american-dream \
		gpl-american-way \
		greve-clown \
		guardian-article \
		hague \
		historical-apsl \
		ICT-for-prosperity \
		ipjustice \
		java-trap \
		javascript-trap \
		judge-internet-usage \
		keep-control-of-your-computing \
		kevin-cole-response \
		kragen-software \
		latest-articles \
		lessig-fsfs-intro \
		lest-codeplex-perplex \
		linux-gnu-freedom \
		luispo-rms-interview \
		mcvoy \
		microsoft \
		microsoft-antitrust \
		microsoft-new-monopoly \
		microsoft-old \
		microsoft-verdict \
		misinterpreting-copyright \
		moglen-harvard-speech-2004 \
		motif \
		ms-doj-tunney \
		my_doom \
		netscape \
		netscape-npl \
		netscape-npl-old \
		new-monopoly \
		nit-india \
		no-ip-ethos \
		no-word-attachments \
		nonsoftware-copyleft \
		not-ipr \
		open-source-misses-the-point \
		opposing-drm \
		papadopoulos-response \
		patent-practice-panel \
		patent-reform-is-not-enough \
		philosophy \
		pirate-party \
		plan-nine \
		practical \
		pragmatic \
		privacyaction \
		protecting \
		public-domain-manifesto \
		push-copyright-aside \
		reevaluating-copyright \
		rieti \
		right-to-read \
		rms-comment-longs-article \
		rms-hack \
		rms-interview-edinburgh \
		rms-kol \
		rms-on-radio-nz \
		rtlinux-patent \
		savingeurope \
		second-sight \
		self-interest \
		selling \
		selling-exceptions \
		shouldbefree \
		social-inertia \
		software-libre-commercial-viability \
		software-literary-patents \
		software-patents \
		speeches-and-interview \
		stallman-kth \
		stallman-mec-india \
		stallmans-law \
		stophr3028 \
		sun-in-night-time \
		sylvester-response \
		the-danger-of-ebooks \
		the-law-of-success-2 \
		the-root-of-this-problem \
		third-party-ideas \
		trivial-patent \
		ucita \
		udi \
		university \
		use-free-software \
		using-gfdl \
		vaccination \
		w3c-patent \
		wassenaar \
		who-does-that-server-really-serve \
		why-audio-format-matters \
		why-copyleft \
		why-free \
		wipo-PublicAwarenessOfCopyright-2002 \
		words-to-avoid \
		wsis \
		wsis-2003 \
		x \
		your-freedom-needs-free-software

philosophy/economics_frank :=	frank

philosophy/sco :=	questioning-sco \
			sco \
			sco-gnu-linux \
			sco-preemption \
			sco-v-ibm \
			sco-without-fear \
			subpoena

pronunciation :=	pronunciation

server :=	08whatsnew \
		irc-rules \
		mirror \
		server \
		sitemap \
		takeaction \
		tasks

server/standards :=	README.translations \
			webmaster-quiz

software :=	devel \
		for-windows \
		reliability \
		software
